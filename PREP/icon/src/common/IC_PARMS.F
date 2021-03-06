
!------------------------------------------------------------------------!
!  The Community Multiscale Air Quality (CMAQ) system software is in     !
!  continuous development by various groups and is based on information  !
!  from these groups: Federal Government employees, contractors working  !
!  within a United States Government contract, and non-Federal sources   !
!  including research institutions.  These groups give the Government    !
!  permission to use, prepare derivative works of, and distribute copies !
!  of their work in the CMAQ system to the public and to permit others   !
!  to do so.  The United States Environmental Protection Agency          !
!  therefore grants similar permission to use the CMAQ system software,  !
!  but users are requested to provide copies of derivative works or      !
!  products designed to operate in the CMAQ system to the United States  !
!  Government without restrictions as to use by others.  Software        !
!  that is used with the CMAQ system but distributed under the GNU       !
!  General Public License or the GNU Lesser General Public License is    !
!  subject to their copyright restrictions.                              !
!------------------------------------------------------------------------!

      MODULE IC_PARMS

C......................................................................
C  From INCLUDE FILE: IC_PARMS.EXT

C  CONTAINS: Dimensioning parameters and data for ICON

C  DEPENDENT UPON: None

C  REVISION HISTORY: Prototype created by Jerry Gipson, January, 1998
C                    Modified by JG May, 1999 to treat PinG concs
C                    Remove PING by J.Young June, 2011
C                    Made into an F90 MODULE - J.Young, May 2012
C......................................................................


!terra5:/home/yoj/src/arc/test/CCTM-repo/hadv/yamo> find /home/yoj/src/arc/ICON-git -name '*.[fF]' -exec grep -i IC_PARMS.EXT {} \; -print
!      INCLUDE 'IC_PARMS.EXT'    ! ICON paramters
!/home/yoj/src/arc/ICON-git/common/icon.F
!      INCLUDE 'IC_PARMS.EXT'  ! ICON parameters
!/home/yoj/src/arc/ICON-git/common/lst_spc_map.F
!      INCLUDE 'IC_PARMS.EXT'  ! ICON parameters
!/home/yoj/src/arc/ICON-git/common/ngc_spc_map.F
!      INCLUDE 'IC_PARMS.EXT'   ! ICON parameters
!/home/yoj/src/arc/ICON-git/common/opn_ic_file.F
!      INCLUDE 'IC_PARMS.EXT'    ! BCON paramters
!/home/yoj/src/arc/ICON-git/m3conc/m3_ck_ctmmet.F
!      INCLUDE 'IC_PARMS.EXT'    ! ICON parameters
!/home/yoj/src/arc/ICON-git/m3conc/m3_ck_ctms.F
!      INCLUDE 'IC_PARMS.EXT'    ! BCON paramters
!/home/yoj/src/arc/ICON-git/m3conc/m3_ck_icmet.F
!      INCLUDE 'IC_PARMS.EXT'    ! ICON paramters
!/home/yoj/src/arc/ICON-git/m3conc/m3_driver.F
!      INCLUDE 'IC_PARMS.EXT'    ! ICON paramters
!/home/yoj/src/arc/ICON-git/m3conc/m3_icout.F
!      INCLUDE 'IC_PARMS.EXT'    ! ICON paramters
!/home/yoj/src/arc/ICON-git/m3conc/m3_vinterp.F
!      INCLUDE 'IC_PARMS.EXT'    ! ICON paramters
!/home/yoj/src/arc/ICON-git/profile/prof_driver.F
!      INCLUDE 'IC_PARMS.EXT'    ! ICON paramters
!/home/yoj/src/arc/ICON-git/profile/prof_icout.F
!      INCLUDE 'IC_PARMS.EXT'    ! ICON paramters
!/home/yoj/src/arc/ICON-git/profile/prof_vinterp.F
!      INCLUDE 'IC_PARMS.EXT'    ! ICON paramters
!/home/yoj/src/arc/ICON-git/tracer/trac_driver.F
!      INCLUDE 'IC_PARMS.EXT'    ! ICON paramters
!/home/yoj/src/arc/ICON-git/tracer/trac_ic.F


C Dimensioning parameters

      INTEGER, PARAMETER :: MX_MECHFL_IC = 500  ! Max no. of species

      INTEGER, PARAMETER :: MX_INFL_SP = 500    ! Max no. of species in an input file

      INTEGER, PARAMETER :: MXCTMS = 3          ! Max no. of input CTM files

C Type declarations

C Root names of possible output files
      INTEGER, PARAMETER :: NROOTS = 5
      CHARACTER( 16 ) :: ICFL_ROOT( NROOTS ) = (/   ! Output file root names
     &                   'INIT_CONC_',
     &                   'INIT_GASC_',
     &                   'INIT_AERO_',
     &                   'INIT_NONR_',
     &                   'INIT_TRAC_' /)

C Catalogued tracer species names
      INTEGER, PARAMETER :: NTRACERS = 8    ! No. of catalogued tracers
      CHARACTER( 16 ) :: TRAC_NAME( NTRACERS ) = (/ ! Catalogued tracer names
     &                   'IC1_BC0',
     &                   'IC1_BC1',
     &                   'IC0_BC1',
     &                   'STREET ',
     &                   'CHKBRD ',
     &                   'SPOS_A ',
     &                   'SPOS_B ',
     &                   'SPOS_C ' /)

C Descriptions of tracers species
      CHARACTER( 80 ) :: TRAC_DESC( NTRACERS ) = (/ ! Description of catalogued tracers
     &                   'Uniform IC/BC with IC = 1.0 and BC 0.0   ',
     &                   'Uniform IC/BC with IC = 1.0 and BC 1.0   ',
     &                   'Uniform IC/BC with IC = 0.0 and BC 0.0   ',
     &                   'Checkerboard pattern of IC/BC = 1.0 & 0.0',
     &                   'Street pattern of IC/BC = 1.0 & 0.0      ',
     &                   'Signal A for superposition test, A-B-C=0 ',
     &                   'Signal B for superposition test, A-B-C=0 ',
     &                   'Signal C for superposition test, A-B-C=0 ' /)

C Descriptions of catalogued vertical coordinate systems
      CHARACTER( 23 ) :: VGDESC( 8 ) = (/           ! Description of vertical grid type
     &                   'Hydrostatic sigma-p    ',
     &                   'Non-hydrostatic sigma-p',
     &                   'Sigma-z                ',
     &                   'Pressure (mb)          ',
     &                   'Z (m above sea level)  ',
     &                   'H (m above ground      ',
     &                   'WRF mass-core sigma    ',
     &                   'WRF NMM                ' /)

C When generating "fine grid" icon output from a "coarse grid" concentration file...
C If the vertical grid type is different between the input concentration file and
C the targeted, output icon file, the mid-layer height fields (ZH) for both the
C "coarse" input and the "fine" output are required from appropriate MET_CRO_3D files.
      CHARACTER( 16 ) :: MET_CRO_3D_CRS = 'MET_CRO_3D_CRS'   ! coarse grid
      CHARACTER( 16 ) :: MET_CRO_3D_FIN = 'MET_CRO_3D_FIN'   ! fine grid

      END MODULE IC_PARMS

