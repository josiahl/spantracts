function s_dtiInit
%
% This function loads a series of subjects and performs dtiInit for each
%

% Path to subjects
datapath = '/media/lcne/matproc';

% Subject names
subjects = {'am160914'};

for isubj = 1:length(subjects)
    % Build the file names for dwi, bvecs/bvals, t1
    dwiPath = fullfile(datapath, subjects{isubj},'raw');
    dwiFile = fullfile(dwiPath, [subjects{isubj} '.nii.gz']);
    t1File = fullfile(datapath, subjects{isubj}, [subjects{isubj} '_t1_acpc.nii.gz']);

    % Set preprocessing parameters:
    % 2 mm isotropic voxels
    % Rotate the B vectors when transforming data to AcPc space
    dwiParams = dtiInitParams;
    %dwiParams.clobber = true;
    %dwiParams.eddyCorrect = 0;
    %dwiParams.flipLrApFlag = true;
    dwiParams.dwOutMm = [2, 2, 2];
    %dwiParams.phaseEncodeDir = 1;
    %dwiParams.rotateBvecsWithRx = true;
    dwiParams.rotateBvecsWithCanXform = true;
    dtiInit(dwiFile, t1File, dwiParams);
end