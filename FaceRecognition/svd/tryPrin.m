function [ prin,Accs,C,gamma] = tryPrin()
%TRYPRIN Summary of this function goes here
%   Detailed explanation goes here
    bestAcc=0;
    Accs=[];
    for i=1:4
        [ trainSet,labels,testSet,testlabel ] = getSets(i);
        [ Cb,gammab] = tryArg( trainSet,labels,testSet,testlabel );
        cmd=['-t 2 -c ',num2str(Cb),' -g ',num2str(gammab)];
        model=svmtrain(labels,trainSet,cmd);
        [p,acc,d]=svmpredict(testlabel,testSet,model);
        acc2=mean(double(p==testlabel));
        if acc2>bestAcc
            prin=i;
            bestAcc=acc2;
            C=Cb;
            gamma=gammab;
        end
        Accs=[Accs;i acc2 C gamma];
    end
end

