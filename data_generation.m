load("base_matrices\NR_1_0_2.txt") %values to change
B=NR_1_0_2; % values to change
msg_matrix=[];
codeword_matrix=[];
Encoded_output=[];
[m,n]=size(B);

z=2; %values to change
k=(n-m)*z;
EbN0db=3; % values to change
EbNo = 10^(EbN0db/10);
sigma = sqrt(1/(2*(k/(n-2*z))*EbNo));
for i= 1:60000
    msg=randi([0,1],1,22*2);
    code=nrldpc_encode(B,2,msg)
    symbol = 1 - 2 * code;  
    result = symbol + sigma * randn(1,n*z);
    msg_matrix(end+1, :)=msg;
    codeword_matrix(end+1, :)=code;
    Encoded_output(end+1,:)=result;



end
% filename_ebn0db_baseMatrix_expansionFactor
writematrix(msg_matrix,'./msg/msg_3_1_2.txt');
writematrix(codeword_matrix,'./code_word/codeword_3_1_2.txt');
writematrix(Encoded_output,'./encoded_input_noise/encodedInputNoise_3_1_2.txt');
