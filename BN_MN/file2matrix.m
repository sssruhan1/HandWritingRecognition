% CSE574 PROJECT 2 file2matrix(filename)
% Ruhan Sa
% This function is for reading input file with txt format(given ground
% truth) into matrix Mw, Md, Mv, denoting writer, document and Value.

function [Mw, Md, Mv] = file2matrix(filename)

fileID = fopen(filename);
i = 1;

while ~feof(fileID)

	[ M(:, i), count] = fscanf(fileID, '%d, %c, %d, %d, %d, %d, %d, %d, %d, %d, %d ', 11);
	if count ~= 11
		error(sprintf('Missing element in line %d', i));
    end
	i = i + 1;
end
 Mw = M ( 1, :);
 Md = M ( 2, :);
 Mv = M ( 3 : 11, :);
