#example for running /analysis/BIDS/sub-10311
#we have to do this strange mount, because --participant_label does not work correctly
#this mount guarantees that in the container there is a BIDS directory with only one folder sub-10311, and with the necessary other two files to make it BIDS compatible: .bidsignore and the data_description.json

#example 1:
#docker run -i --rm -v /analysis/BIDS/sub-10311:/mybids/sub-10311:ro -v /analysis/Argyelan/test:/output -v /nethome/amiklos/argyelan@gmail.com/howto/GitHub/hcppipeline_my:/mycoeff:ro -v /usr/local/opt/freesurfer5.3/:/mylicense:ro -v /analysis/BIDS/dataset_description.json:/mybids/dataset_description.json -v /analysis/BIDS/.bidsignore:/mybids/.bidsignore  amiklos/hcppipeline:4.04 --n_cpus 12 --gdcoeffs /mycoeff/coeff.grad --license_key /mylicense/license.txt /mybids /output participant

#example 2 with specific stages:
#docker run -i --rm -v /analysis/BIDS/sub-10311:/mybids/sub-10311:ro -v /analysis/Argyelan/test:/output -v /nethome/amiklos/argyelan@gmail.com/howto/GitHub/hcppipeline_my:/mycoeff:ro -v /usr/local/opt/freesurfer5.3/:/mylicense:ro -v /analysis/BIDS/dataset_description.json:/mybids/dataset_description.json -v /analysis/BIDS/.bidsignore:/mybids/.bidsignore  amiklos/hcppipeline:4.04 --n_cpus 12 --gdcoeffs /mycoeff/coeff.grad --stages fMRIVolume fMRISurface --license_key /mylicense/license.txt /mybids /output participant


#solve:/mycoeff/coeff.grad should be in the github as well...

#amiklos/hcppipeline:4:04 is genearted based on argyelan/HCPPIPELINE repository ZHHSpecific branch