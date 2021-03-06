# Julio Change Detection
# get_patition_cells.m
# 20201024 Xiaoyang Chen
# two way to get patition cells: get_partition_cells or traverse


###function partitions = get_partition_cells(TEST_DATA, tree, MAX_DEPTH)
if (nargin<3) {MAX_DEPTH <- Inf}
# then go to function: partitions = traverse(TEST_DATA,tree,1,MAX_DEPTH);

###function partitions = traverse(TEST_DATA,tree,curr_depth,MAX_DEPTH)
tree<-data.frame("threshold"=0, "split_dir"=matrix(0,nrow=10,ncol=1),"right"=0, "left"=0)
partitions=matrix(NA,1:dim(cx)[1],1)
partitions[1:dim(cx)[1],1] <- tree; 
if (curr_depth >=MAX_DEPTH){break}
if (left %notin% tree){break}
if (tree$left=0){break}

idx=as.integer((cx*(tree$split_dir))<=tree$threshold)

if (sum(idx)>0) {
  lparts<-traverse(cx[idx,:],tree$left,curr_depth+1,MAX_DEPTH)
  partitions[idx]<-lparts
}
else {
  rparts<-traverse(cx[-1*idx,:],tree$left,curr_depth+1,MAX_DEPTH)
  partitions[idx]<-rparts
}
# TBD define tranverse

