function matrix=fliprows(matrix)
	numrows=rows(matrix);
	%numcols=columns(matrix);
	%flip every second row
	for loop=1:numrows
		if(mod(loop,2)==0)
			a=matrix(loop,1:end);
			matrix(loop,:)=fliplr(a);
			end
		endfor
	return;
	end
