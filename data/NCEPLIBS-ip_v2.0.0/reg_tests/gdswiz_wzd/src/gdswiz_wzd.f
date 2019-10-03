 program gdswiz_wzd
 
!------------------------------------------------------------------
! Test gdswiz and gdswzd routines for all map projections.  
!
! Routines are called twice to test both the (1) i/j to lat/lon 
! and the (2) lat/lon to i/j conversions.  This should be
! reversable.  If not, a warning message is printed to
! standard output.  (1) is invoked by setting the IOPT argument
! to '0' and (2) is invoked by setting it to '-1'.
!
! This program takes two arguments.  The first is 'WIZ' or 'WZD'
! to run either the gdswiz or gdswzd set of routines.  The second is
! the grid number.  The valid grids are defined by data statements
! below.  The grid numbers have no special meaning.
!
! All computed fields are output to a direct access file so
! they may be compared for bit-idenicalness with other test runs,
! or so they may be visualized.  Separate files are written
! to output the data from each call to gdswiz/wzd.  The
! file naming convention is:
!
! grid${gridnum}.iopt${0 or m1}.bin
!------------------------------------------------------------------

 implicit none

 character*3   :: grid, routine
 character*100 :: outfile

 integer*4 :: i1
 integer   :: nret, lrot, lmap, iopt, npts, imdl, jmdl
 integer   :: i, j, n, iret, kgds(200), nscan, kscan, is1, nm
 integer   :: ii, jj, iii, jjj, badpts

 logical   :: wzd

 real :: diff, fill, maxdiffx, maxdiffy
 real, allocatable :: xpts(:,:), ypts(:,:)
 real, allocatable :: rlat(:,:), rlon(:,:)
 real, allocatable :: crot(:,:), srot(:,:)
 real, allocatable :: xlon(:,:), xlat(:,:)
 real, allocatable :: ylon(:,:), ylat(:,:), area(:,:)

! the grids that will be tested.

 integer :: grd3(200)    ! one-degree lat/lon, for gdswiz00 and gdswzd00 routines
 data grd3 / 0, 360, 181, 90000, 0, 128, -90000,  &
            -1000, 1000, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 180*0/

 integer :: grd8(200)    ! mercator, for gdswiz01 and gdswzd01 routines
 data grd8 / 1, 116, 44, -48670, 3104, 128, 61050,  &
             0, 22500, 0, 64, 318830, 318830, 0, 0, 0, 0, 0, 0, 255, 180*0/

 integer :: grd127(200)  ! gaussian (t254), for gdswiz04 and gdswzd04 routines
 data grd127 /4, 768, 384, 89642, 0, 128, -89642,  &
             -469, 469, 192, 0, 0, 255, 0, 0, 0, 0, 0, 0, 255, 180*0/

 integer :: grd203(200)  ! nam e-grid, for gdswizcb and gdswzdcb routines
 data grd203 /203, 669, 1165, -7450, -144140, 136, 54000,  &
              -106000, 90, 77, 64, 0, 0, 0, 0, 0, 0, 0, 0, 255, 180*0/

 integer :: grd212(200)  ! afwa nh polar, spherical earth, for gdswiz05 and gdswzd05 routines
 data grd212 /5,2*512,-20826,145000,8,-80000,2*47625,0,  &
              9*0,255,180*0/

 integer :: grd222(200)  ! afwa nh polar, oblate spheroid earth for gdswiz05 and gdswzd05
                         ! routines.  note gdswzd05 does not have this option and 
                         ! treats it as spherical.
 data grd222 /5,2*512,-20826,145000,72,-80000,2*47625,0,  &
              9*0,255,180*0/

 integer :: grd213(200)  ! afwa sh polar, spherical earth for gdswiz05 and gdswzd05 routines.
                         ! note, there is a difference in how gdswiz05
                         ! and gdswzd05 define the orientation angle.
                         ! gdswzd05 assumes +100 degrees for this grid.
                         ! this is handled with logic below.
 data grd213/5,2*512,20826,-125000,8,-80000,2*47625,128, &
             9*0,255,180*0/

 integer :: grd205(200)  ! nam 12km b-grid, for gdswizcd and gdswzdcd routines
 data grd205 /205, 954, 835, -7491, -144134, 136, 54000,  &
             -106000, 126, 108, 64, 44540, 14800, 0, 0, 0, 0, 0, 0, 255, 180*0/

 integer :: grd202(200)  ! nam 12km b-grid, for gdswizca and gdswzdca routines
 data grd202 /202, 0, 0, -7491, -144134, 136, 954, 835,  &
              126, 108, 64, 0, 0, 0, 0, 0, 0, 0, 0, 255, 180*0/

 integer :: grd218(200)  ! lambert conformal (ncep grid 218) for gdswiz03 and gdswzd03 routines
 data grd218 /3, 614, 428, 12190, -133459, 8, -95000,  &
              12191, 12191, 0, 64, 25000, 25000, 0, 0, 0, 0, 0, 0, 255, 180*0/

 i1=1
 call getarg(i1,routine)
 select case (routine)
   case ('WIZ')
     wzd=.false.
   case ('WZD')
     wzd=.true.
   case default
     print*,"DO YOU WANT TO TEST GDSWIZ OR GDSWZD?"
     stop
 end select

 i1=2
 call getarg(i1,grid)

 kgds=0
 select case (trim(grid))
   case ('3')
     kgds=grd3
     imdl=kgds(2)
     jmdl=kgds(3)
   case ('8')
     kgds=grd8
     imdl=kgds(2)
     jmdl=kgds(3)
   case ('201')
     call grid_201(wzd)
     goto 98
   case ('203')
     kgds=grd203
     imdl=kgds(2)
     jmdl=kgds(3)
   case ('127')
     kgds=grd127
     imdl=kgds(2)
     jmdl=kgds(3)
   case ('202')
     kgds=grd202
     imdl=kgds(7)
     jmdl=kgds(8)
   case ('205')
     kgds=grd205
     imdl=kgds(2)
     jmdl=kgds(3)
   case ('212')
     kgds=grd212
     imdl=kgds(2)
     jmdl=kgds(3)
   case ('222')
     kgds=grd222
     imdl=kgds(2)
     jmdl=kgds(3)
   case ('213')
     kgds=grd213
     imdl=kgds(2)
     jmdl=kgds(3)
     if (wzd) kgds(7) = 100000
   case ('218')
     kgds=grd218
     imdl=kgds(2)
     jmdl=kgds(3)
   case default
     print*,"ENTER GRID NUMBER TO TEST"
     stop
 end select

 if (wzd) then
   print*,"TEST GDSWZD ROUTINE"
 else
   print*,"TEST GDSWIZ ROUTINE"
 endif
 print*,"PROCESS GRID ", grid

!---------------------------------------------------------------------------
! first, call gdswzd to calculate lat/lon for each grid point.
!---------------------------------------------------------------------------

 fill = -9999.

 allocate (xpts(imdl,jmdl),ypts(imdl,jmdl))
 allocate (rlat(imdl,jmdl),rlon(imdl,jmdl))
 allocate (crot(imdl,jmdl),srot(imdl,jmdl))
 allocate (xlon(imdl,jmdl),xlat(imdl,jmdl))
 allocate (ylon(imdl,jmdl),ylat(imdl,jmdl),area(imdl,jmdl))

 xpts = fill
 ypts = fill
 rlat = fill
 rlon = fill
 crot = fill
 srot = fill
 xlon = fill
 xlat = fill
 ylon = fill
 ylat = fill
 area = fill

 lrot = 1
 lmap = 1
 iopt = 0
 npts = imdl * jmdl

 if (wzd) then
   call gdswzd(kgds, iopt, npts, fill, xpts, ypts, rlon, rlat, &
               nret, lrot, crot, srot, lmap, xlon, xlat, ylon, ylat, area)
 else
   call gdswiz(kgds, iopt, npts, fill, xpts, ypts, rlon, rlat, &
               nret, lrot, crot, srot)
 end if

 if (nret /= npts) then
   print*,'ERROR. WRONG NUMBER OF POINTS RETURNED ',nret,npts
   stop 33
 endif

 print*,'LAT/LON POINT(1,1):   ',rlat(1,1),rlon(1,1)
 print*,'LAT/LON POINT(1,JM):  ',rlat(1,jmdl),rlon(1,jmdl)
 print*,'LAT/LON POINT(IM,1):  ',rlat(imdl,1),rlon(imdl,1)
 print*,'LAT/LON POINT(IM,JM): ',rlat(imdl,jmdl),rlon(imdl,jmdl)

 outfile = "./grid" // trim(grid) // ".iopt0.bin"
 open (9, file=trim(outfile), access='direct', err=55, recl=imdl*jmdl*4)
 write(9, rec=1, err=55) real(rlat,4)
 write(9, rec=2, err=55) real(rlon,4)
 write(9, rec=3, err=55) real(xpts,4)
 write(9, rec=4, err=55) real(ypts,4)
 write(9, rec=5, err=55) real(crot,4)
 write(9, rec=6, err=55) real(srot,4)
 write(9, rec=7, err=55) real(xlon,4)
 write(9, rec=8, err=55) real(xlat,4)
 write(9, rec=9, err=55) real(ylon,4)
 write(9, rec=10, err=55) real(ylat,4)
 write(9, rec=11, err=55) real(area,4)
 close (9)

! the first call to gdswzd computed the lat/lon at each point.  now,
! given that lat/lon, compute the i/j.  it should be reversable.

 iopt = -1
 xpts=fill
 ypts=fill

 if (wzd) then
   call gdswzd(kgds, iopt, npts, fill, xpts, ypts, rlon, rlat,&
               nret, lrot, crot, srot, lmap, xlon, xlat, ylon, ylat, area)
 else
   call gdswiz(kgds, iopt, npts, fill, xpts, ypts, rlon, rlat, &
               nret, lrot, crot, srot)
 endif

 if (nret /= npts) then
   print*,'ERROR. WRONG NUMBER OF POINTS RETURNED ',nret,npts
   stop 34
 endif

 outfile = "./grid" // trim(grid) // ".ioptm1.bin"
 open (49, file=trim(outfile), access='direct', err=55, recl=imdl*jmdl*4)
 write(49, rec=1, err=55) real(rlat,4)
 write(49, rec=2, err=55) real(rlon,4)
 write(49, rec=3, err=55) real(xpts,4)
 write(49, rec=4, err=55) real(ypts,4)
 write(49, rec=5, err=55) real(crot,4)
 write(49, rec=6, err=55) real(srot,4)
 write(49, rec=7, err=55) real(xlon,4)
 write(49, rec=8, err=55) real(xlat,4)
 write(49, rec=9, err=55) real(ylon,4)
 write(49, rec=10, err=55) real(ylat,4)
 write(49, rec=11, err=55) real(area,4)
 close (49)

!------------------------------------------------------------------------------
! did the second call to gdswzd work?
!
! note: the gdswzdcb routine works on a grid that is tilted 45 degrees, so
! the internal i/j's do not match the normal convention.  account for this.
!------------------------------------------------------------------------------

 maxdiffx = -99999.
 maxdiffy = -99999.

 if (kgds(1) == 203) then
   kscan=mod(kgds(11)/256,2)
   if(kscan.eq.0) THEN
     is1=(jmdl+1)/2
   else
     is1=jmdl/2
   endif
   nm=imdl*jmdl
   nscan=mod(kgds(11)/32,2)
   badpts = 0
   do iii = 1, imdl    ! here iii/jjj are the conventional i/j
   do jjj = 1, jmdl
     n = (jjj-1)*imdl + iii
     if(nscan.eq.0) then
       j=(n-1)/imdl+1
       i=(n-imdl*(j-1))*2-mod(j+kscan,2)
     else
       i=(n-1)/jmdl+1
       j=(n-jmdl*(i-1))*2-mod(i+kscan,2)
     endif
     ii = (is1+(i-(j-kscan))/2)  ! here, ii/jj are from the tilted grid
     jj = ((i+(j-kscan))/2)      ! the tilted value is stored in xpts/ypts.
     diff = abs(float(ii)-xpts(iii,jjj))
     maxdiffx = max(maxdiffx, diff)
     if ( diff > .01) then
       print*,'BAD X POINT: ',iii,jjj,ii,jj,xpts(iii,jjj),ypts(iii,jjj)
       badpts=badpts+1
     endif 
     diff = abs(float(jj)-ypts(iii,jjj))
     maxdiffy = max(maxdiffy, diff)
     if ( diff > .01) then
       print*,'BAD Y POINT: ',iii,jjj,ii,jj,xpts(iii,jjj),ypts(iii,jjj)
       badpts=badpts+1
     endif 
   enddo
   enddo
 else
   badpts=0
   do j = 1, jmdl
   do i = 1, imdl
     diff = abs(float(i)-xpts(i,j))
     maxdiffx = max(maxdiffx, diff)
     if ( diff > .01) then
       print*,'BAD X POINT: ',i,j,xpts(i,j),ypts(i,j)
       badpts=badpts+1
     endif 
     diff = abs(float(j)-ypts(i,j))
     maxdiffy = max(maxdiffy, diff)
     if ( diff  > .01) then
       print*,'BAD Y POINT: ',i,j,xpts(i,j),ypts(i,j)
       badpts=badpts+1
     endif 
   enddo
   enddo
 endif

 if (badpts > 0) print*,"NUMBER OF BAD POINTS: ", badpts
 print*,'MAX DIFFERENCES IN X/Y CALCULATIONS: ', maxdiffx, maxdiffy

 deallocate (xpts,ypts,rlat,rlon,crot,srot,xlon,xlat,ylon,ylat,area)

 98 continue

 print*,'NORMAL TERMINATION'

 stop

 55 continue
 print*,'ERROR WRITING OUTPUT FILE.'
 stop 44

 end program gdswiz_wzd

 subroutine grid_201(wzd)
 
! test routine gdswzdc9 of ipolates.  the interface for this routine is
! very different than the other gdswzd routines, which is why I am
! testing it with a separate routine.  since gdswzdc9 is a less accurate
! version of gdswzdcb, maybe we should try to get rid of it.

 implicit none

 character*100 :: outfile

 integer   :: nret, lrot, lmap, iopt, npts, im, jm, ims, jms
 integer   :: i, j, n, iret, kgds(200), nscan, kscan
 integer   :: badpts

 logical, intent(in) :: wzd

 real              :: fill, maxdiffx, maxdiffy
 real, allocatable :: xpts(:), ypts(:), xpts_save(:), ypts_save(:)
 real, allocatable :: xpts_2d(:,:), ypts_2d(:,:)
 real, allocatable :: rlat(:), rlon(:)
 real, allocatable :: rlat_2d(:,:), rlon_2d(:,:)
 real, allocatable :: crot(:), srot(:)
 real, allocatable :: crot_2d(:,:), srot_2d(:,:)
 real, allocatable :: xlon(:), xlat(:), ylon(:), ylat(:), area(:)
 real, allocatable :: xlon_2d(:,:), xlat_2d(:,:), ylon_2d(:,:), ylat_2d(:,:), area_2d(:,:)

 integer :: grd201(200)  ! nam e-grid
! 12km nam grid - mass points
 data grd201 /201, 0, 0, -7450, -144140, 136, 669, 1165, 90, 77,  &
              64, 0, 0, 0, 0, 0, 0, 0, 0, 255, 180*0/
! 12km nam grid - velocity points
!data grd201 /201, 0, 0, -7450, -144140, 136, 669, 1165, 90, 77,  &
!             320, 0, 0, 0, 0, 0, 0, 0, 0, 255, 180*0/

 if (wzd) then
   print*,"TEST GDSWZD ROUTINE"
 else
   print*,"TEST GDSWIZ ROUTINE"
 endif
 print*,"PROCESS GRID 201"

 kgds=grd201

 im=kgds(7)*2-1  
 jm=kgds(8)

 kscan=mod(kgds(11)/256,2)
 if(kscan.eq.0) then
   print*,'PROCESS MASS GRID'
   npts=(im/2+1)*jm-jm/2
 else
   print*,'PROCESS VELOCITY GRID'
   npts=im/2*jm+jm/2
 endif

 ims = kgds(7)  ! i/j of staggered grid
 jms = kgds(8)

 fill = -9999.

 allocate (xpts(npts),ypts(npts))
 allocate (rlat(npts),rlon(npts))
 allocate (crot(npts),srot(npts))
 allocate (xlon(npts),xlat(npts))
 allocate (ylon(npts),ylat(npts),area(npts))

 xpts=fill
 ypts=fill
 rlat=fill
 rlon=fill
 crot=fill
 srot=fill
 xlon=fill
 xlat=fill
 ylon=fill
 ylat=fill
 area=fill

 lrot = 1
 lmap = 1
 iopt = 0

 if (wzd) then
   call gdswzd(kgds, iopt, npts, fill, xpts, ypts, rlon, rlat, &
               nret, lrot, crot, srot, lmap, xlon, xlat, ylon, ylat, area)
 else
   call gdswiz(kgds, iopt, npts, fill, xpts, ypts, rlon, rlat, &
               nret, lrot, crot, srot)
 endif

 if (nret /= npts) then
   print*,'ERROR. WRONG NUMBER OF POINTS RETURNED ',nret,npts
   stop 38
 endif

 print*,'LAT/LON FIRST POINT: ', rlat(1), rlon(1)
 print*,'LAT/LON LAST POINT:  ', rlat(npts), rlon(npts)

!---------------------------------------------------------------------------
! ipolates works on an 'unstaggered' grid (tilted 45 degrees).  convert to a 
! staggered grid for Grads.  note: alternate rows will have one less
! grid point. 
!---------------------------------------------------------------------------

 allocate (rlat_2d(ims,jms))
 allocate (rlon_2d(ims,jms))
 allocate (xpts_2d(ims,jms))
 allocate (ypts_2d(ims,jms))
 allocate (crot_2d(ims,jms))
 allocate (srot_2d(ims,jms))
 allocate (xlon_2d(ims,jms))
 allocate (xlat_2d(ims,jms))
 allocate (ylon_2d(ims,jms))
 allocate (ylat_2d(ims,jms))
 allocate (area_2d(ims,jms))

 rlat_2d=99999.
 rlon_2d=99999.
 xpts_2d=99999.
 ypts_2d=99999.
 crot_2d=99999.
 srot_2d=99999.
 xlon_2d=99999.
 xlat_2d=99999.
 ylon_2d=99999.
 ylat_2d=99999.
 area_2d=99999.

 nscan=mod(kgds(11)/32,2)

 do n=1, npts
   call n2ij(n,kscan,nscan,im,jm,i,j)
   rlat_2d(i,j)=rlat(n)
   rlon_2d(i,j)=rlon(n)
   xpts_2d(i,j)=xpts(n)
   ypts_2d(i,j)=ypts(n)
   crot_2d(i,j)=crot(n)
   srot_2d(i,j)=srot(n)
   xlon_2d(i,j)=xlon(n)
   xlat_2d(i,j)=xlat(n)
   ylon_2d(i,j)=ylon(n)
   ylat_2d(i,j)=ylat(n)
   area_2d(i,j)=area(n)
 enddo

 outfile = "./grid201.iopt0.bin"
 open (9, file=trim(outfile), access='direct', err=77, recl=ims*jms*4)
 write(9, rec=1, err=77) real(rlat_2d,4)
 write(9, rec=2, err=77) real(rlon_2d,4)
 write(9, rec=3, err=77) real(xpts_2d,4)
 write(9, rec=4, err=77) real(ypts_2d,4)
 write(9, rec=5, err=77) real(crot_2d,4)
 write(9, rec=6, err=77) real(srot_2d,4)
 write(9, rec=7, err=77) real(xlon_2d,4)
 write(9, rec=8, err=77) real(xlat_2d,4)
 write(9, rec=9, err=77) real(ylon_2d,4)
 write(9, rec=10, err=77) real(ylat_2d,4)
 write(9, rec=11, err=77) real(area_2d,4)
 close (9)

 allocate(xpts_save(npts))
 allocate(ypts_save(npts))
 xpts_save=xpts
 ypts_save=ypts

 iopt = -1
 xpts=fill
 ypts=fill

 if (wzd) then
   call gdswzd(kgds, iopt, npts, fill, xpts, ypts, rlon, rlat,&
               nret, lrot, crot, srot, lmap, xlon, xlat, ylon, ylat, area)
 else
   call gdswiz(kgds, iopt, npts, fill, xpts, ypts, rlon, rlat,&
               nret, lrot, crot, srot)
 endif

 if (nret /= npts) then
   print*,'ERROR. WRONG NUMBER OF POINTS RETURNED ',nret,npts
   stop 44
 endif

 rlat_2d=99999.
 rlon_2d=99999.
 xpts_2d=99999.
 ypts_2d=99999.
 crot_2d=99999.
 srot_2d=99999.
 xlon_2d=99999.
 xlat_2d=99999.
 ylon_2d=99999.
 ylat_2d=99999.
 area_2d=99999.

 do n=1, npts
   call n2ij(n,kscan,nscan,im,jm,i,j)
   rlat_2d(i,j)=rlat(n)
   rlon_2d(i,j)=rlon(n)
   xpts_2d(i,j)=xpts(n)
   ypts_2d(i,j)=ypts(n)
   crot_2d(i,j)=crot(n)
   srot_2d(i,j)=srot(n)
   xlon_2d(i,j)=xlon(n)
   xlat_2d(i,j)=xlat(n)
   ylon_2d(i,j)=ylon(n)
   ylat_2d(i,j)=ylat(n)
   area_2d(i,j)=area(n)
 enddo

 outfile = "./grid201.ioptm1.bin"
 open (59, file=trim(outfile), access='direct', err=77, recl=ims*jms*4)
 write(59, rec=1, err=77) real(rlat_2d,4)
 write(59, rec=2, err=77) real(rlon_2d,4)
 write(59, rec=3, err=77) real(xpts_2d,4)
 write(59, rec=4, err=77) real(ypts_2d,4)
 write(59, rec=5, err=77) real(crot_2d,4)
 write(59, rec=6, err=77) real(srot_2d,4)
 write(59, rec=7, err=77) real(xlon_2d,4)
 write(59, rec=8, err=77) real(xlat_2d,4)
 write(59, rec=9, err=77) real(ylon_2d,4)
 write(59, rec=10, err=77) real(ylat_2d,4)
 write(59, rec=11, err=77) real(area_2d,4)
 close(59)

 deallocate(rlat_2d, rlon_2d, xpts_2d, ypts_2d, crot_2d, srot_2d)
 deallocate(xlon_2d, xlat_2d, ylon_2d, ylat_2d, area_2d)

 maxdiffx = -99999.
 maxdiffy = -99999.

 badpts=0
 do n = 1, npts
   maxdiffx = max(maxdiffx, abs(xpts_save(n)-xpts(n)))
   if (abs(xpts_save(n)-xpts(n)) > 0.01) then
     print*,'BAD X POINT: ',n,xpts_save(n),xpts(n),ypts_save(n),ypts(n)
     badpts=badpts+1
   endif 
   maxdiffy = max(maxdiffy, abs(ypts_save(n)-ypts(n)))
   if (abs(ypts_save(n)-ypts(n)) > 0.01) then
     print*,'BAD Y POINT: ',n,xpts_save(n),xpts(n),ypts_save(n),ypts(n)
     badpts=badpts+1
   endif 
 enddo

 if (badpts > 0) print*, 'NUMBER OF BAD POINTS: ', badpts
 print*,'MAX DIFFERENCES IN X/Y CALCULATIONS: ', maxdiffx, maxdiffy

 deallocate(xpts_save, ypts_save)
 deallocate(rlat, rlon, xpts, ypts, crot, srot)
 deallocate(xlon, xlat, ylon, ylat, area)

 return 

 77 continue
 print*,'-ERROR WRITING OUTPUT BINARY FILE.'
 stop 56

 end subroutine grid_201

 subroutine n2ij(n,kscan,nscan,im,jm,i,j)

 implicit none

 integer, intent(in)    :: n, kscan, nscan, im, jm
 integer, intent(out)   :: i, j
 integer                :: nn

 nn=2*n-1+kscan
 if(nscan.eq.0) then
   j=(nn-1)/im+1
   i=nn-im*(j-1)
 else
   i=(nn-1)/jm+1
   j=nn-jm*(i-1)
 endif
! alternate rows have one less point.
 if (kscan == 0)then
   if (mod(j,2)==0) then
     i = i/2
   else
     i = i/2 + 1
   endif
 else
   if (mod(j,2)==0) then
     i = i/2 + 1
   else
     i = i/2
   endif
 endif

 return
 end subroutine n2ij
