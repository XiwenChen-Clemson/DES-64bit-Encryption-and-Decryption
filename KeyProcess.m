function SubKey = KeyProcess(Key)
%Keys processing. 
%Define PC1 permutation. Parity check auto drop
KeyPC1 = Key([        57  49  41 33	25	17	9 ...
                      1	  58  50 42	34	26	18 ...
                      10  2	  59 51	43	35	27 ...
                      19  11  3	 60	52	44	36 ...
                      63  55  47 39	31	23	15 ...
                      7	  62  54 46	38	30	22 ... 
                      14  6	  61 53	45	37	29 ...
                      21  13  5	28	20	12	4]);
%Split PC1L and PC1R
PC1L = KeyPC1(1:28);
PC1R = KeyPC1(29:56);                

%Define key shifiting
R = [1 1 2 2 2 2 2 2 1 2 2 2 2 2 2 1];


%Generate round-wise subkey
    for i = 1:16
       KeyL  =  [PC1L(R(i)+1:end),PC1L(1:R(i))];
       KeyR  =  [PC1R(R(i)+1:end),PC1R(1:R(i))]; 
       Key56 = [KeyL, KeyR];
       %PC2 permutation
       SubKey(i,:) = Key56([14 17	11	24	1	5	3	28 ...
                            15	6	21	10	23	19	12	4 ...
                            26	8	16	7	27	20	13	2 ...
                            41	52	31	37	47	55	30	40 ...
                            51	45	33	48	44	49	39	56 ...
                            34	53	46	42	50	36	29	32]);
       
    end


end





