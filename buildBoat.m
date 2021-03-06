%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creates boat model
% MEJ 6/2/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function model = buildBoat()

model.sail = buildSail();
model.hull = buildHull();
model.rudder = buildRudder();

function rudder = buildRudder()

%build at centre of rotation

cyl = UnitCylinder(2);
hinge = scale(translate(cyl,0,0,-1),0.02, 0.02, 0.05);
hinge.facecolor = [.5 .5 .5];
hinge.edgecolor = [.5 .5 .5];
flat.vertices = [0 0 0; 0.3 0 0; 0.3 0 -0.4; 0 0 -0.5];
flat.faces = [1 2 3 4];
flat.facecolor = [1 .86 .72];

rudder.model = translate(combine(hinge, flat), 2, 0, -0.86);
rudder.transVector = [2; 0; -0.86];

function sail = buildSail()

%build at centre of rotation

cyl = UnitCylinder(2);
mast = scale(translate(cyl,0,0,1),0.05,0.05,1.6);
mast.facecolor = [.5 .5 .5];
mast.edgecolor = [.5 .5 .5];

boom = translate(rotateY(scale(cyl,0.02,0.02,1),-90),1.05,0,0.2);
boom.facecolor = [.5 .5 .5];
boom.edgecolor = [.5 .5 .5];

sheet.vertices = [0 0 0; 0 0 1; 1 0 0];
sheet.faces = [1 2 3];
sheet = translate(scale(sheet,2,1,2.8),0.05,0,0.2);
sheet.facecolor = [.7 .7 .2];
sheet.edgecolor = 'black';

sail.model = translate(combine(mast,boom,sheet),-1,0,-0.86);
sail.transVector = [-1;0;-0.86];

function hull = buildHull()

model.vertices = [0.5 -0.4 -0.4; ...
                0 -0.5 0; ...
                0 0.5 0; ...
                0.5 0.4 -0.4; ...
                3.8 0.4 -0.4; ...
                4 0.5 0; ...
                4 -0.5 0; ...
                3.8 -0.4 -0.4 ];
model.faces = [1 2 3 4; 3 4 5 6;  5 6 7 8; 1 2 7 8; 1 4 5 8; 2 3 6 7];
model.facecolor = 'red';
model.edgecolor = 'black';

hull.model = translate(model, -2,0,-0.86);
hull.transVector = [0;0;0];

