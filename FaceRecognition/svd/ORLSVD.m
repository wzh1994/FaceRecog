clear;clc;
%C=1.4;
%gamma=0.014;
%[trainSet,labels,testSet,testlabel ] = getSets(2);
[prin,Accs,C,gamma]=tryPrin();
[trainSet,labels,testSet,testlabel ] = getSets(prin);
cmd=['-t 2 -c ',num2str(C),' -g ',num2str(gamma)];
model=svmtrain(labels,trainSet,cmd);
[p,acc,d]=svmpredict(testlabel,testSet,model);
acc2=mean(double(p==testlabel));
clc;
acc2