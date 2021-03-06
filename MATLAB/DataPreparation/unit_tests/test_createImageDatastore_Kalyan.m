% Testing createImageDatastore.m

%% parameters

[ paths, processing_params, exec_flags] = config_params_Kalyan();

[data_dir, masks_dir, ~, ~] = v2struct(paths);
[~, ~, ~, ~, ~, ~, roi] = v2struct(processing_params);
[verbose, visualize, sav] = v2struct(exec_flags);

base_tiles_path = fullfile(data_dir, 'Datasets4MATLAB');
factor = 0.8;
save_mixed = false;
tile_sizes_m = [50 100 150 200];
tile_sizes = [84 167 250 334];

num_datasets = length(tile_sizes);


num_datasets = length(tile_sizes);

summary_flag = true;
preview_flag = true;

save_flag = false;

%% create image datastore and show summary and sample of the 4 classes
for n = 4
    disp(['Creating image data store # ', num2str(n), ' out of ', ...
        num2str(num_datasets)]);
    tile_size = tile_sizes(n);
    tile_size_m = tile_sizes_m(n);
    str = ['px' num2str(tile_size) 'm' num2str(tile_size_m)];
    image_dataset_location = fullfile(base_tiles_path,str);
    [imds] = createImageDatastore( image_dataset_location, summary_flag,...
        preview_flag);
    if save_flag
        image_datastore_location = fullfile(sav_path,str);
        sav_file = fullfile(image_datastore_location, 'imds.mat');
        save(sav_file, 'imds');
    end
    disp('-----------------------------------------------------------------');
end
disp('DONE.');