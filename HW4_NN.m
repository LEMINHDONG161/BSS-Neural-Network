

close('all');
clear;
load('C:\Users\OSElab\Desktop\MINH DONG\LEMINHDONG_trituenhantao\new_data10'); 
read_data_train = data_train;
read_data_test = data_test;
 train=read_data_train(:,1:2048)';
 train_label= read_data_train(:,2049)';
 test=read_data_test(:,1:2048)';
 test_label= read_data_test(:,2049)';

%%% 10 label
%class1_data= read_data_train(find(read_data_train(:,2049) == 1),2049);
test_10label=[ test_label; test_label; test_label; test_label; test_label; test_label; test_label; test_label; test_label; test_label];
train_10label=[train_label; train_label; train_label; train_label; train_label; train_label; train_label; train_label; train_label; train_label];
% 4. In this case, we also work as in step 2 with the following changes
iter=85; %Number of iterations
code=5; %Code for the chosen training algorithm
k=10; %number of hidden layer nodes
lr=0.01; %learning rate
par_vec=[lr 0 1.05 1.04 0.7]; %Parameter vector
train_norm=train_10label./10;
[net,tr]=NN_training(train,train_norm,k,code,iter,par_vec);

% Compute the training and the test errors
%pe_train=NN_evaluation(net,train,train_label)
%pe_test=NN_evaluation(net,test,test_label)
y1=sim(net,test);
%z_euclidean=euclidean_classifier(m_hat,test');
%pe=sum(y.*y1<0)/length(y);
test_norm=test_10label./10;
err= 1- length(find(abs(y1-test_norm)>0.05))/80090
