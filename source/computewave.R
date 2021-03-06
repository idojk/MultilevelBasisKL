# Julio Change Detection
# computewave.m
# 20201222 Xiaoyang Chen

#function [Scfun, Wavefun, Cwave, Dwave] = computewave(M,V,n);
computewave<-function(M,V,n){
  
  # Compute scaling functions and HB
  # from momemnt matrix [U,D,G]=[U,S,V]in matlab = [u,d,v]in R
  # [U,D,G] = svd(M);
  # https://stackoverflow.com/questions/41972419/different-svd-result-in-r-and-matlab
  svdm<- svd(M,nu=nrow(M),nv=ncol(M)) #nu nv to require a full svd
  D<-diag(svdm$d) 
  G<-svdm$v 
  U<-svdm$u 
  
  
  # Construct scaling functions
  numofscalingfunctions <- sum( diag(D) !=0 )
  Cwave <- G[ ,1:numofscalingfunctions]
  Scfun <- V%*%Cwave
  
  # Construct multilevel basis (wavelets)
  if (n > numofscalingfunctions){
  numofwavelets = n - numofscalingfunctions
  Dwave <- G[ ,(numofscalingfunctions + 1):ncol(G)]
  Wavefun <- V%*%Dwave
  } else {
  Wavefun = list()
  Dwave = list()
  }

  
  return(list('Scfun'=Scfun, 'Wavefun'=Wavefun, 'Cwave'=Cwave, 'Dwave'=Dwave))  
}
