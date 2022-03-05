%%  Normalization
function [NormalizatedData] = Normalization(dataset)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - This function tries to convert the data into normal distribution
%       with using one of the normalization equation (for more details, see
%       the normalization equation).
%
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%
% Output:
%       - NormalizatedData: NxM matrix, obtained normal data.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nrows,ncolumn] = size(dataset);

for j = 1:ncolumn
    for i = 1:nrows
        normalization = (dataset(i,j)-min(dataset(:,j)))/(max(dataset(:,j))-min(dataset(:,j)));
        NormalizatedData(i,j) = [normalization];
    end
end

end
