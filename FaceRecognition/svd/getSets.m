function [ trainSet,labels,testSet,testlabel ] = getSets(prin)
%GETSETS Summary of this function goes here
%   Detailed explanation goes here
s1="photo/s";
s2=".BMP";
trainSet=[];
labels=[];
testSet=[];
testlabel=[];
%bs=[0,20;10,30;40,60;50,70;80,100;90,110;120,140;130,150];
for i=0:4
    %figure(i+1);
    for k=1:8 
        num=i*8+k;
        for j=1:10
            s=s1+num+'/'+j+s2;
            s=char(s);
            face=imread(s);
            face=histeq(face,255);
            face_d=double(face);
            [U S V]=svd(face_d);
            S1=sqrt(S(1:prin,1:prin));
            U1=U(:,1:prin)*S1;
            V1=V(:,1:prin)*S1;
            train=[U1(:);V1(:)];
            if j==4||j==8
                testSet=[testSet;train'];
                testlabel=[testlabel;num];
            else
                trainSet=[trainSet;train'];
                labels=[labels;num];
            end
            %face_n=U1*S1*V1';
            %face2=uint8(face_n);
            %subplot(8,20,bs(k,1)+j);
            %imshow(face);
            %subplot(8,20,bs(k,2)+j);
            %imshow(face2);
        end
    end
end
[mu,sigma]=getArg(trainSet);
trainSet=normalize(trainSet,mu,sigma);
testSet=normalize(testSet,mu,sigma);
end

