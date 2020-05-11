% clear the command prompt
clc;
%clears history
clear all;
%close all the files
close all;

%opening the text file
fileID=fopen('horner_test1.txt','r');

%format as float
formatSpec='%f';

%reading the file inputs in size_array as one row till end of file
size_array = [1 inf];
read_file = fscanf(fileID,formatSpec,size_array);

%getting the degree of the polynomial
degree = read_file(1);

% getting the divisor
divisor = read_file(length(read_file));

% extracting numbers for syntetic divison
arr = read_file(2:end-1);

%synthetic division, vector sorting it according it to coefficent
arr_2=flip(arr);


%calling the function
horner_method(arr_2,divisor,degree);
function horner_method(arr_2,divisor,degree)
 
    %getting the final answer
    answer=divisor*0+arr_2(1);
   
    %appending the answer after doing synthic division
    synthetic_answer=[];
    
    % looping through the array to calculate the answer
    newton_answer=[];
    for i=2:(length(arr_2))
        
        %appending the answer after doing synthic division
        synthetic_answer=[synthetic_answer,answer];
        answer=answer*divisor+arr_2(i);
        
    end
    degree=degree-1;
    fprintf('P(%d)=%f\n',divisor,answer);
    %check to do horner's method recursive
    if degree~=0
        horner_method(synthetic_answer,divisor,degree)
    end
%     if degree==1
%         fprintf('P(x)=%f',arr_2(1));
%     end
    
end