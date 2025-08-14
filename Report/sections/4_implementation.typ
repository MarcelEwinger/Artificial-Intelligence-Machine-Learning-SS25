= 4. Implementation

  In my implementation I used python as the programming language along with the following libraries:
  - TensorFlow/Keras for building and training the neural network
  - Scikit-learn for data preprocessing, evaluation and for classical machine learning algorithms
  - Pandas and NumPy for data manipulation and analysis
  - Weights & Biases (W&B) for experiment tracking and hyperparameter optimization

  The core of the machine learning implementation relies on Scikit-learn. It provided the modules for data preprocessing (*StandardScaler, OneHotEncoder*), building composite pipelines (Pipeline, ColumnTransformer), training the classical models (LogisticRegression, SVC, DecisionTreeClassifier, etc.) and calculating performance metrics. For visualizing the libary Matplotlib and Seaborn was used to generate clear and informative plots.

  A systematic approach was used to train and test the classical machine learning models, such as Logistic Regression, Support Vector Machine (SVM), Decision Tree, Random Forest, and K-Nearest Neighbors (KNN). Each model was put into a Scikit-learn Pipeline that linked the preprocessor to the model's classifier.

  The implementation of the Artificial Neural Network (ANN) is handled separately, as it utilizes the TensorFlow and Keras libraries. The overall architecture, particularly the number of hidden layers—was directly adapted from the literature, where several papers implemented an ANN for binary classification using two hidden layers. Given that the performance of ANNs is highly sensitive to their architecture and the choice of hyperparameters. To address this, the Weights & Biases (W&B) platform was used to conduct a comprehensive search for the optimal model configuration. 

  The goal of the optimization process, known as a "Sweep", was to maximize the validation accuracy (val_accuracy) on the held-out test set. The hyperparameter search space was carefully defined to explore a wide range of configurations, including key parameters such as the number of epochs, batch_size, learning_rate, choice of optimizer,  the number of neurons in each of the two hidden layers (hidden_layer_1_size, hidden_layer_2_size), the activation function, and the dropout_rate for regularization. 
  #figure(
  image("../pictures/ann_sweep.png", width: 100%), 
  caption: [Finished Sweep of the ANN],
)
 A total of 100 individual training runs were executed by the W&B agent to explore the defined hyperparameter space. The results of this search are visualized in Figure 5, which illustrates the relationship between different hyperparameter values and the resulting model performance. The W&B sweep identifies the optimal hyperparameter set based on the final validation accuracy (val_accuracy) achieved at the end of training. Interestingly, when the model was re-trained using this supposedly optimal configuration, the resulting performance metrics were inferior to my initial default hyperparameters. An examination of the validation accuracy curves for all 100 runs revealed a crucial insight: one particular run, while not possessing the highest final accuracy, achieved the overall peak accuracy of 0.81 at epoch 18 out of 30. 
   #figure(
  image("../pictures/epoch_val_accuary.png", width: 100%), 
  caption: [Top 10 runs epoch/val_accuracy],
)

  After this finding, i retrained the ANN with the new optimal configuration. The new model slightly outperformed what was previously considered the best configuration. The best-performing model based on Figure 6 utilized the relu activation function, a batch size of 32, a dropout rate of approximately 0.33261386622820965, and was trained for 18 epochs. The optimization was most effective with the adam optimizer using a learning rate of about 0.004939561794461328, and the optimal architecture consisted of two hidden layers, each with 32 neurons. 


  To provide a more detailed view beyond the summary metrics, a granular analysis of the optimized ANN is presented.
  //----------------------------------
#figure(
      image("../pictures/ann_confusionmatrix.png", width: 100%), 
      caption: [Confusion Matrix of the ANN],
     )

 Based on the Confusion matrix the model correctly identified 9.009 normal connections (True Negatives) and 8.904 attack connections (True Positives). The model incorrectly identified 702 normal connections as attacks (False Positives), which would cause false alarms in the real world. More importantly, it didn't catch 3.928 real attacks and instead thought they were normal (False Negatives). This shows the natural trade-off between recall and precision. The ROC curve (AUC = 0.89) shows that the model can tell the difference between good and bad traffic very well.
     //----------------------------------
#figure(
      image("../pictures/ann_loss_function.png", width: 100%), 
      caption: [Accuracy and Loss Model],
     )  

  As seen in the figure, the model is successfully learning and minimizing its error, as seen by the "Loss" plot on the left, where the validation loss (orange) and training loss (blue) both steadily decline and converge. Importantly, the validation loss does not begin to rise, indicating that there was no substantial *overfitting* in the model. This trend is reflected in the "Accuracy" plot on the right side, which shows that both training and validation accuracy are increasing quickly and leveling off at a high level. The validity of the final evaluation metrics is supported by the training and validation curves' close proximity in both plots, which shows how well the model generalizes from the training data to the test data. 





