For a preliminary explanation of Mateda2.2 see the file Mateda2.0-UserGuide.pdf in this directory.
General documentation about the programs is available in the /doc directory or from:
http://www.sc.ehu.es/ccwbayes/members/rsantana/software/matlab/MATEDA.html

MATEDA-2.2 employs the Matlab Bayes Net (BNT) toolbox (Murphy:2001) and the BNT structure learning package (Leray_and_Francois:2004). These programs, which are freely available from the authors, should be installed previously to the MATEDA-2.2 installation.

Matlab Bayes Net (BNT) toolbox can be downloaded from http://bnt.googlecode.com/files/FullBNT-1.0.7.zip.
BNT structure learning package can be downloaded from http://ofrancois.tuxfamily.org/carb/node5_mn.html.

Some of the MATEDA-2.2 routines also employs the MATLAB statistical
toolbox and the affinity propagation  clustering algorithm (Frey_and_Dueck:2007) (the Matlab
implementation of affinity  propagation is available from http://www.psi.toronto.edu/affinitypropagation/).

After installing the BNT and BNT structure learning tools:
 
 1) Set the path to the current BNT structure learning tool directory. This is done by modifying file add_SLP.m. 
 
 2) Unpack the file IntEDA.zip and copy the files to a directory named MATEDA.
  
 3) Edit file InitEnvironment.m updating the paths path_MATEDA, path_FullBNT and path_BNT_SLP.
  
 4) Set the current Matlab directory to the MATEDA directory.
 
 5) Execute program InitEnvironments.m.


Several warnings  but no error should appear. The folder ScriptsMateda contains several  examples of EDAs implementations. The file Mateda2.0-UserGuide.pdf contains a detailed explanation of how to use the programs. 

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 

Last version 2/04/2009. Roberto Santana (roberto.santana@ehu.es)       
