function [ C,gamma ] = tryArg( trainSet,labels,testSet,testlabel )
    %TRY Summary of this function goes here
    %   Detailed explanation goes here
   
   %try 
   %Cs=[0.01;0.03;0.1;0.2;0.5;1;2;4;10;20];
   %gammas=[0.01;0.03;0.1;0.2;0.5;1;2;4;10;20];
   
   %pie without hist
   %Cs=[8;10;12;15]
   %gammas=[0.007;0.01;0.13;0.15;];
   
   %orl without hist
   %Cs=1:0.2:2
   %gammas=0.01:0.002:0.02
   
   %orl without hist
   Cs=1.5:0.1:4.5
   gammas=0.01:0.001:0.02
   bestAcc=0;
   for i=1:31
       for j=1:11
           cmd=['-t 2 -c ',num2str(Cs(i)),' -g ',num2str(gammas(j))];
           model=svmtrain(labels,trainSet,cmd);
           [p,acc,d]=svmpredict(testlabel,testSet,model);
           acc2=mean(double(p==testlabel));
           if acc2>bestAcc
               bestAcc=acc2;
               C=Cs(i);
               gamma=gammas(j)
           end
       end
   end
end

