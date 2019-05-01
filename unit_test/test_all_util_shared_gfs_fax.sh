#!/bin/sh
#            Test All Utilities in util_shared.v1.0.8 
#    This script use utilities in ut_shared v1.0.8 to generate
#    the GFS FAX chart image *.gif files.
#
#  1) Execute FXCOMPOZ
#  2) Execute RAS2BIT
#  3) Execute SIXBIT
#  4) Execute TRPSTCMV

set +x

set +x
echo " "
echo "###################################################"
echo "  Test Execute FXCOMPOZ  RAS2BIT SIXBIT TRPSTCMV  "
echo "###################################################"
echo " "
test_gfs_fax_fxcompoz.sh

test_gfs_fax_gendata.sh
test_gfs_fax_ras2bity.sh
test_gfs_fax_redstat.sh
test_gfs_fax_sixbitb.sh
test_gfs_fax_trpsfcmv.sh


echo  ""
exit

