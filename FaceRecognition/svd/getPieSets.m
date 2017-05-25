function [ trainSet,labels,testSet,testlabel ] = getPieSets( prin )
%GETPIESETS Summary of this function goes here
%   Detailed explanation goes here
    feas=[];
    gnds=[];
    isTests=[];
    for i=1:5
        s=char("pie/Pose0"+i+"_64x64");
        load(s);
        feas=[feas;fea];
        gnds=[gnds;gnd];
        isTests=[isTests;isTest];
    end
    gnds=double(gnds);
    sz=size(feas,1);
    trainSet=[];
    labels=[];
    testSet=[];
    testlabel=[];
    for i=1:sz
       pic=reshape(feas(i,:),64,64)';
       [U S V]=svd(double(pic));
       U=U(:,1:prin);
       V=V(:,1:prin);
       S=sqrt(S(1:prin,1:prin));
       U1=U*S;
       V1=V*S;
       pic=[U1(:);V1(:)]';
       if isTests(i)==1 
           testSet=[testSet;pic];
           testlabel=[testlabel;gnds(i)];
       else
           trainSet=[trainSet;pic];
           labels=[labels;gnds(i)];
       end
    end
    [mu,sigma]=getArg(trainSet);
    trainSet=normalize(trainSet,mu,sigma);
    testSet=normalize(testSet,mu,sigma);
end

