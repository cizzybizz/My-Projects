%%Chris Mullen 2013-2014
%%Experiment 1A

%%%This Program Creates Two Sets Of Images, One Shows A Simple Animation Of Two Coloured Boxes Moving Across
%%%A Simple Background, And Another, Showing The Same Animation, Only Every Second Frame Is Flipped.
%%%This Is Designed To Produce Consistant Frames(All Frames Are 1.4kb) To Be Used To Test ffmpeg's Motion 
%%%Estimation Algorithm. (The Flipped Frames Should Make Motion Estimation Impossible)

function gen(mkvid=true,play=true)
	%%mkvid=true means compress frames to video
	%%play=true means play the compressed video after it is created

	%%GENERATE RGB SHAPES
	%%prepare RGB matrices (image will be 400x400 pixels)
	red=zeros(400,400);
	green=zeros(400,400);
	blue=zeros(400,400);
	%%colour them(0-255)		(overlapping pixels will mix colours)
	red(1:400,1:100)=0;
	green(200:400,1:400)=255;
	blue(1:200,1:400)=255;
	%%bundle them together
	background=cat(3,red,green,blue);
	%image(background);

	%%create box
	red=zeros(100,100);
	green=zeros(100,100);
	blue=zeros(100,100);
	%%colour them(0-255)
	red(1:100,1:100)=255;
	green(1:100,1:100)=0;
	blue(1:100,1:100)=0;
	%%bundle them together
	mybox=cat(3,red,green,blue);
	%image(mybox);

	%%create Output Directories
	system("rm -rf normal;rm -rf flipped");
	system("mkdir normal; mkdir flipped");
	system("mkdir normal/tmp; mkdir flipped/tmp");
	mkframes(background,mybox);
	if(mkvid==true)
		mpg(play);
	else
		if(play==true)
			printf("video not present, \"mkvid\" should equal true\n");
			endif
		endif
	end
function tmpdir
	system("rm -rf normal; rm -rf flipped");
	system("mkdir normal; mkdir flipped");
	end
function mkframes(background,mybox)
	%%create frames
	frame=background;
	frame(55:154,25:124)=mybox(1:100,1:100);
	frame(275:374,275:374)=mybox(1:100,1:100);
	%image(frame1);
	imwrite(frame,"normal/frame1.png");
	imwrite(frame,"flipped/frame1.png");

	frame=background;
	frame(55:154,55:154)=mybox(1:100,1:100);
	frame(245:344,245:344)=mybox(1:100,1:100);
	imwrite(frame,"normal/frame2.png");
	frame=(flipdim(frame,1));%%flip frames 180 degrees
	imwrite(frame,"flipped/frame2.png");

	frame=background;
	frame(55:154,85:184)=mybox(1:100,1:100);
	frame(215:314,215:314)=mybox(1:100,1:100);
	imwrite(frame,"normal/frame3.png");
	imwrite(frame,"flipped/frame3.png");

	frame=background;
	frame(55:154,115:214)=mybox(1:100,1:100);
	frame(245:344,185:284)=mybox(1:100,1:100);
	imwrite(frame,"normal/frame4.png");
	frame=(flipdim(frame,1));%%flip frames 180 degrees
	imwrite(frame,"flipped/frame4.png");

	frame=background;
	frame(55:154,145:244)=mybox(1:100,1:100);
	frame(275:374,155:254)=mybox(1:100,1:100);
	imwrite(frame,"normal/frame5.png");
	imwrite(frame,"flipped/frame5.png");

	frame=background;
	frame(55:154,175:274)=mybox(1:100,1:100);
	frame(245:344,125:224)=mybox(1:100,1:100);
	imwrite(frame,"normal/frame6.png");
	frame=(flipdim(frame,1));%%flip frames 180 degrees
	imwrite(frame,"flipped/frame6.png");

	frame=background;
	frame(55:154,205:304)=mybox(1:100,1:100);
	frame(215:314,95:194)=mybox(1:100,1:100);
	imwrite(frame,"normal/frame7.png");
	imwrite(frame,"flipped/frame7.png");

	frame=background;
	frame(55:154,235:334)=mybox(1:100,1:100);
	frame(245:344,65:164)=mybox(1:100,1:100);
	imwrite(frame,"normal/frame8.png");
	frame=(flipdim(frame,1));%%flip frames 180 degrees
	imwrite(frame,"flipped/frame8.png");

	frame=background;
	frame(55:154,265:364)=mybox(1:100,1:100);
	frame(275:374,35:134)=mybox(1:100,1:100);
	imwrite(frame,"normal/frame9.png");
	imwrite(frame,"flipped/frame9.png");

	frame=background;
	frame(55:154,295:394)=mybox(1:100,1:100);
	frame(295:394,5:104)=mybox(1:100,1:100);
	imwrite(frame,"normal/frame10.png");
	frame=(flipdim(frame,1));%%flip frames 180 degrees
	imwrite(frame,"flipped/frame10.png");
	end
