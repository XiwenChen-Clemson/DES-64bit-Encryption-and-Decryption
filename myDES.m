function Output = myDES(message,mode,key)
%   DES encrypt and Decrypt
%   Input and Key should be 1x64 binary vector (no auto error detector for this)
%   Modes: 'ENC' 'DEC'
%   Xiwen Chen:xc53@nau.edu
%   Exercise purpose

   %Key Parity check (odd)
   KeyParityMatrix = reshape(key,8,8);
   for i = 1:8
       if mod(sum(KeyParityMatrix(i,:)),2)~=1
          error('Key parity check failed')
       end     
   end
   
   %subkeys preparing
   SubKey = KeyProcess(key);
   % Initial permutation
   MessageIP = IP(message); 
   
   HalfL = MessageIP(1:32);
   HalfR = MessageIP(33:64);
   % Round pre-procssing
   switch mode
        case 'ENC' % splitting
            L{1} = HalfL; 
            R{1} = HalfR; 
        case 'DEC' %  swapping 
            L{1} = HalfR;
            R{1} = HalfL;  
   end
  
  % Round operation
   for i = 1:16
      L{i+1}  = R{i}; 
      ExpendR = ExpansionPermutation(R{i});
      
         if mode =='ENC'
            XorOutput = xor(ExpendR,SubKey(i,:));
            else
            XorOutput = xor(ExpendR,SubKey(16-i+1,:));
         end
      
      % S-box
      SboxOutput =  SBOX(XorOutput);
      % p-box. f-function output
      PboxOutput = PBOX(SboxOutput);
      R{i+1} = xor(L{i},PboxOutput);
   end
   
  % Final inverse permutation
    if mode =='ENC'
         MessageOut = [L{17},R{17}]; 
      else
         MessageOut = [R{17},L{17}];      
    end
    
    Output = IIP(MessageOut);
    
    
end
   


