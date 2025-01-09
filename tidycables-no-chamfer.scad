// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Text
// (c) 2024 Ali Craigmile <ali@craigmile.com>


ducts = 8;
ductwidth=5;
between=12;

ductdepth=15;
depth=12;
cutawaydepth=4;
length=((ductwidth+between)*ducts)+between;
tracklength=((ductwidth+between)*ducts);
screw=4;
screwhead=8.5;
screwheaddepth=2.5;

cutawaywidth=20;
width=40;

box=[length,width,depth];
cutawaybox=[length,cutawaywidth,cutawaydepth];
cableduct=[ductwidth,ductdepth,depth];
track=[tracklength,5,5];

difference() {

    cube(box,false);

    //cutaway area for desk mounting
    translate([0,0,depth-cutawaydepth]) {
        cube(cutawaybox,false);
    }

    //cable ducts
    for(i=[0:ducts-1]) {
        x = ((ductwidth+between) * i) + between;
        y = width-ductdepth;
        translate([x,y,0]) {
            cube(cableduct,false);
        }
    }

    //retaining track 
    translate([between/2,width-15,depth-3]) {
        cube(track,false);
    }

    //mounting holes
    translate([between+(ductwidth/2),cutawaywidth/2,0]) {
        cylinder(depth,screw/2,screw/2);
    }

    translate([between+(ductwidth/2),cutawaywidth/2,0]) {
        cylinder(screwheaddepth,screwhead/2,screwhead/2);
    }


    //countersink mounting holes
    translate([length-between-(ductwidth/2),cutawaywidth/2,0]) {
        cylinder(depth,screw/2,screw/2);
    }

    translate([length-between-(ductwidth/2),cutawaywidth/2,0]) {
        cylinder(screwheaddepth,screwhead/2,screwhead/2);
    }



}

