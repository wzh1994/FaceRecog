clear;clc;
%[prin,Accs,C,gamma]=tryPiePrin();
C=8;
gamma=0.13;
[ trainSet,labels,testSet,testlabel ] = getPieSets( 1 );
%[trainSet,labels,testSet,testlabel ] = getPieSets(prin);
cmd=['-t 2 -c ',num2str(C),' -g ',num2str(gamma)];
model=svmtrain(labels,trainSet,cmd);
[p,acc,d]=svmpredict(testlabel,testSet,model);
acc2=mean(double(p==testlabel));
clc;
acc2