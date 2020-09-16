# INF638

This repo is for demo my INF638 project codes.
Any question plsease contact me:xc53@nau.edu

## Project 1: Image Encryption by DEs 64 bit
- `myDES(message,mode,key)`  is the basic function to enc and dec by using DES 64 bit. Please make sure that input size of message
and key are 1x16 vector. `mode` includes 'ENC' and 'DEC'
- subfunctions `m.`file list: `SBOX.m`,`PBOX.m`,`KeyProcess.m`,`IP.m` (initial permutation), `IIP.m` (inverse initial permutation),
  `ExpansionPermutation.m`.
- Noting: No bit swapping after round 16.
