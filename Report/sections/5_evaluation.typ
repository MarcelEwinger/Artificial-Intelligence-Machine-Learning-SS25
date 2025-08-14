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

Based on F1-Score the Decision Tree emerges as the top-performing (0.8071) closely followed by the optimized ANN (0.7557). 

One of the most interesting findings was the notable trade-off between precision and recall. It was impressive how precise most of our models were, especially the Decision Tree and KNN. This is crucial, because it means when they classify something as an attack, they're very likely correct. It helps to keep those false alarms to a minimum. However, that excellent precision came at a real cost: significantly lower recall, mostly hovering between 0.60 and 0.69. What this tells us is critical: while these models are precise in what they do detect, they're simply failing to catch a significant portion of the actual attacks happening. For a system designed to detect real-world intrusions, that's a monumental weakness.

When compared to the baseline from #cite(<sapre2019robust>), the results are more nuanced. The SVM from the baseline study, with an F1-Score of 0.8476, shows a better balance between precision and recall than any model from my project. Nonetheless, the optimized ANN and Decision Tree from this study still outperform the baseline's ANN and Random Forest models in terms of F1-Score. This highlights that while my models are highly precise, further work would be needed to improve their ability to detect all instances of malicious activity.




