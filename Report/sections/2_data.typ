= 2. Data

The NSL-KDD dataset, also well-known as a benchmark in the field of the network intrusion detection systems (NIDS) research, is used in this project #cite(<ingre2015performance>). To address some of the inherent statistical problems of the original KDD'99 dataset, the University of New Brunswick developed it as an improved version #cite(<sapre2019robust>). In order to prevent machine learning algorithms from being biased towards the more frequent records and from learning rare but significant attack patterns. The new dataset was primarily created to eliminate the enormous number of redundant and duplicate records that were present in the original KDD'99 dataset #cite(<ravipati2019intrusion>).


While various versions of the NSL-KDD dataset are available on platforms like Kaggle, differing in format and scope, this project utilizes the core *KDDTrain+.txt* and *KDDTest+.txt* files, which are also used in most other projects. A key advantage of using these specific files is that the dataset is already separated into training and testing sets #cite(<zaib2025>).
The dataset contains network connection records, each described by 41 features and labeled with a specific attack type or as 'normal'. These features are a mix of continuous, discrete, and symbolic data types. They capture a  broad range of properties from basic connection duration and protocol type (e.g., TCP, UDP, ICMP) to higher-level traffic characteristics like the rate of connection errors. For this project, the primary goal is binary classification between normal and attack. Therefore, the original multi-class labels, which include categories such as 'Normal', 'DoS', 'Probe', 'R2L', and 'U2R' #cite(<mohammed2020multilayer>), were transformed into a single binary target variable. Connections labeled 'normal' were mapped to 0, and all attacks connections were combined to 1. This resulted in a reasonably balanced class distribution in the training set, with approximately 53% normal traffic and 47% attack traffic.
#figure(
  image("../pictures/distribuation_attack_normal.png", width: 80%), 
  caption: [Distribution of Attack vs Normal Traffic], // The figure caption
 
)


A exploratory analysis revealed several key characteristics of the data that necessitated a structured preprocessing pipeline. The dataset was found to be *complete*, with no missing or null values. However, an analysis of the numerical features showed vast differences in scale. For instance, features like *src_bytes* can have values in the millions, while many rate-based features are normalized between 0 and 1. 
#figure(
  image("../pictures/numercial_feature_scale.png", width: 100%), 
  caption: [Excerpt Statistical overview of numerical network features], // The figure caption
 
)
This disparity makes feature scaling a mandatory step to prevent algorithms that are sensitive to feature magnitude. Consequently, the *StandardScaler* was selected to transform all numerical features to have a mean of zero and a standard deviation of one.
#figure(
  image("../pictures/standardScaler.png", width: 100%), 
  caption: [Mean and Std. before and after the use of StandardScaler], // The figure caption
 
)

Furthermore, the feature *num_outbound_cmds*, was identified as having zero variance across all records, providing no predictive information and was therefore removed from both the training and testing sets. The three categorical *features—protocol_type, service, and flag—were* converted into a numerical format using *one-hot encoding*. This technique is essential for algorithms that require numerical inpust. A notable effect of this process is the significant expansion of the dataset's dimensionality, which resulted in the increase of features from 40 to 121. This expansion is primarily driven by the high cardinality of the service type feature, which contains 70 unique categories.
#figure(
  image("../pictures/categorial_types.png", width: 100%), 
  caption: [Categorial Features Analysis], // The figure caption
 
)
 All these preprocessing steps were systematically encapsulated within a ColumnTransformer pipeline to ensure consistent and reproducible data transformation for both model training and subsequent evaluation.