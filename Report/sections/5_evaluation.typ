= 5. Evaluation
In the evaluation phase, I assessed the performance and outcomes of my implemented approach for intrusion detection using the NSL-KDD dataset. I analysed and visualized the results to understand the effectiveness of the approach compared to baselines from the literature. The primary goal is to determine which model is most effective for the task of binary intrusion detection on the NSL-KDD dataset. To ensure a comprehensive assessment, a standard set of classification metrics was employed like, Accuracy, Precision, Recall, F1-Score and AUC.

All models were trained on the full preprocessed training set and subsequently evaluated on the unseen, preprocessed test set. The results of this evaluation are summarized in Figure. This table presents the performance of the models developed in this project alongside. 
   #figure(
      image("../pictures/summary_table.png", width: 100%), 
      caption: [Summary Table of all algorithms],
     )  

The baseline results are taken from a study by #cite(<sapre2019robust>), which conducted a similar binary classification task on the NSL-KDD dataset.  

#table(
  columns: 4,
  table.header(
    [Model],
    [Precision],
    [Recall],
    [F1-Score], 
  ),
  [SVM],
  [0.8839], [0.8142], [0.8476],
  [Random Forest],
  [0.9683], [0.6158], [0.7528],
  [ANN],
  [0.9661], [0.6205], [0.7557],
)

Based on F1-Score the Decision Tree emerges as the top-performing (0.8071) closely followed by the optimized ANN (0.7557). A critical insight from these results is the pronounced trade-off between precision and recall. Most models, particularly the Decision Tree and KNN, achieve exceptionally high precision (over 0.96). This means that when they classify a connection as an attack, they are very likely to be correct, minimizing false alarms. However, this comes at the cost of a significantly lower recall (mostly between 0.60 and 0.69). This implies that while the models are precise, they fail to identify a substantial portion of the actual attacks, a critical vulnerability for a real-world intrusion detection system. 

When compared to the baseline from #cite(<sapre2019robust>), the results are more nuanced. The SVM from the baseline study, with an F1-Score of 0.8476, shows a better balance between precision and recall than any model from my project. Nonetheless, the optimized ANN and Decision Tree from this study still outperform the baseline's ANN and Random Forest models in terms of F1-Score. This highlights that while my models are highly precise, further work would be needed to improve their ability to detect all instances of malicious activity.




