%% test script
% I dont testd this since I dont have the data. Please make sure Mite
% in my opinion it needs a pipeline since theres no way to place the data
% into a multilayer and all importers average or ensemble
% have to run braph2genesis first

%% Load data
density = 1;
load_name = ['Updated_AllsubBinaryConnectome_den' num2str(density)];
load(load_name)
data = data_connbin;

%% Create graph
g = MultilayerWU('B', data);

%% calculate measures
mc_global = g.get('MEASURE', 'GLOBALMC');
mc_nodal = g.get('MEASURE', 'NODALMC');