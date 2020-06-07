Sets z  'zone index'   / 1*12 /;
Set p 'Types of production facilities' / SMRCCS, ONWTE, OFFWTE, NATGAS /;
Set s 'Types of Storage facilities' / SALTCAVERNS, SVESSEL, MVESSEL, LVESSEL /;
Set y 'Planning period'/ 2015,2020,2025,2030,2035,2040,2045,2050/;
Set h 'Timeslice' / 1*16 /;

ALIAS (z,z1);

BINARY VARIABLES  
Sin(z,s,y,h) Describes whether hydrogen is transported into storage technology s in zone z at timeslice h
Sout(z,s,y,h) Describes whether hydrogen is transported out of storage technology s in zone z at timeslice h
X(z,z1,y,h) Describes if hydrogen is transported using transmission technology t from zone z to z1 at timeslice h
;

INTEGER VARIABLES
NPI(z,p,y) Number of new production tech p built in zone z at planning period y
NSI(z,s,y) Number of new storage tech s built in zone z at planning period y
NTIpipe(z,z1,y) Number of new pipleine tech units built in zone z to z1 at planning period y
NTpipe(z,z1,y) Number of pipelines connecting zone z to z1 at planning period y
NTtruck(z,y) Number of trucks in zone z at planning period y
NTItruck(z,y) Number of new trucks installed in zone z at planning period y
;

Variables
TDC 'Total discounted cost'
TotalEmission 'Total carbon emission';

POSITIVE VARIABLES
CAPEXP(y) Total Capital Expenditure on production technologies in year y=2050
CAPEXS(y) Total Capital Expenditure on STORAGE technologies in year y=2050
CAPEXT(y) Total Capital Expenditure on TRANSPORT technologies in year y=2050

OPEXP(y) Total OPEX Expenditure on production technologies in year y=2050
OPEXS(y) Total OPEX Expenditure on STORAGE technologies in year y=2050
OPEXT Total OPEX Expenditure on TRANSPORT technologies in year y=2050

PRD(z,p,y,h) Amount produced zone z using production facility p in planning period y and time slice h
PRDCAP(z,p,y) Total production capacity of facility p in zone z in planning period y
PRDCAPI(z,p,y) Increased production capacity of facility p in zone z planning period y

QTpipe(z,z1,y,h) Flowrate from zone z to z1, by transmission of pipeline at planning period y time slice h
QTtruck(z,z1,y,h) Flowrate from zone z to z1, by trasmission of truck at planning period y time slice h
QSin(z,s,y,h) Flowrate into storage technology s in zone z at time slice h
QSout(z,s,y,h) Flowrate out storage technology s in zone z at time slice h

Store(z,s,y,h) Amount stored in zone z at timeslice h at planning period y
STRCAP(z,s,y) Total storage capacity of facility s in zone z in planning period y
STRCAPI(z,s,y) Increased storage capacity of facility s in zone z in planning period y
TC(y) Total costs incurred in planning period y
VTtruck(z,z1,y,h) Amount transported by truck between zone z and z1 in planning period y time slice h
StoreF(z,s) Final storage volume in last year and last timeslice
PRDCAPtimeslice(z,p,y,h) Capacity of production for each time slice
PRDSHOW(p) show
Emission(y) Total emissions in each planning period
EReduction(y) Emission reduction in each planning period

PRDYEAR(p,y) Show production every year
PRDH(p,h) Show production every year
StoreH(s,h) Show storage per time slice
PipeH(z,z1,y,h) pipe time slices
QSinTotal(y)  Show
QSoutTotal(y) show
StoreY(y) show
PRDCAPISUM(y,p)
NPISUM(y,p)
NTIpipeSum(y)
ELECGRID(z,p,y,h) Flowrate used for electricity grid
TotalDemand(y)
;

TABLE
Distance(z,z1) 'Pipeline Distance between z1 and z2'
       1        2       3       4       5       6       7       8       9       10      11      12
1      0.00	147.17	125.56	238.87	275.46	322.90	397.30	412.65	469.73	538.58	244.43	401.61
2      147.17	0.00	63.63	96.21	128.30	234.76	262.94	278.62	349.67	398.37	389.88	258.95	
3      125.56	63.63	0.00	123.77	170.26	205.54	272.78	287.97	344.66	450.65	367.39	310.29	
4      238.87	96.21	123.77	0.00	52.89	178.48	167.99	183.65	260.75	334.84	483.22	195.78	
5      275.46	128.30	170.26	52.89	0.00	216.46	163.40	178.12	266.53	282.85	517.62	143.22	
6      322.90	234.76	205.54	178.48	216.46	0.00	158.46	166.08	168.16	452.37	547.39	331.78	
7      397.30	262.94	272.78	167.99	163.40	158.46	0.00	15.69	106.90	308.02	640.17	211.10	
8      412.65	278.62	287.97	183.65	178.12	166.08	15.69	0.00	95.56	309.31	655.32	218.48	
9      469.73	349.67	344.66	260.75	266.53	168.16	106.90	95.56	0.00	389.91	705.64	312.28	
10     538.58	398.37	450.65	334.84	282.85	452.37	308.02	309.31	389.91	0.00	765.50	140.37	
11     244.43	389.88	367.39	483.22	517.62	547.39	640.17	655.32	705.64	765.50	0.00	634.44	
12     401.61	258.95	310.29	195.78	143.22	331.78	211.10	218.48	312.28	140.37	634.44	0.00    
;

TABLE
RoadDistance(z,z1) 'Road Distance between z1 and z2'
       1        2       3       4       5       6       7       8       9       10      11      12
1      0.00	202.78	173.81	292.90	333.13	466.71	453.83	518.21	582.58	690.41	411.99	550.39
2      199.56	0.00	89.32	125.21	185.07	305.77	333.13	379.80	444.18	510.16	601.89	371.76
3      150.15	84.17	0.00	165.76	209.21	291.29	329.91	365.32	458.66	532.69	585.80	397.51
4      276.81	125.21	165.76	0.00	69.68	254.28	225.31	252.67	341.18	461.88	682.36	255.89
5      333.13	185.07	209.21	66.14	0.00	281.63	206.00	255.89	341.18	323.48	682.36	185.07
6      468.32	339.57	286.46	230.14	268.76	0.00	188.29	214.04	278.42	542.35	827.20	436.13
7      453.83	333.13	366.93	225.31	204.39	188.29	0.00	19.96	123.28	346.01	870.65	260.71
8      518.21	370.15	354.05	251.06	255.89	202.78	19.31	0.00	123.60	371.76	922.15	284.85
9      589.02	439.35	463.49	346.01	339.57	288.07	125.21	112.01	0.00	453.83	1012.27	374.98
10     661.44	511.77	535.91	394.29	326.70	547.18	341.18	365.32	455.44	0.00	997.79	247.84
11     408.77	601.89	580.97	683.97	740.30	827.20	870.65	901.23	965.60	994.57	0.00	856.17
12     518.21	368.54	394.29	251.06	185.07	439.35	243.01	284.85	374.98	244.62	925.37	0.00
;

TABLE
Demand(y,z,h) 'Demand in zone z and timeslice h'
         1      2       3       4       5        6      7       8       9       10      11      12      13      14      15      16
2050.1   147.2	458.8	218.7	149.5	113.3	269.6	144.4	86.3	37.5	57.0	26.5	12.8	97.6	225.2	120.2	70.8
2050.2   395.1	1234.2	586.8	402.1	304.6	725.4	388.0	232.7	101.0	153.2	71.3	34.6	262.4	605.8	323.0	190.9
2050.3   307.5	960.8	456.5	313.0	237.1	564.8	301.9	181.2	78.6	119.3	55.6	27.0	204.3	471.7	251.4	148.7
2050.4   235.9	735.2	350.6	239.5	181.6	431.9	231.4	138.3	60.2	91.3	42.4	20.4	156.4	360.8	192.6	113.3
2050.5   274.7	855.6	408.3	278.7	211.4	502.6	269.4	160.9	70.0	106.3	49.3	23.7	182.1	419.9	224.2	131.8
2050.6   264.9	824.2	393.9	268.5	203.7	484.1	259.7	154.8	67.4	102.4	47.4	22.7	175.5	404.4	216.1	126.8
2050.7   157.8	494.4	234.0	161.1	121.8	290.7	155.1	93.5	40.5	61.3	28.7	14.1	105.0	242.8	129.2	76.8
2050.8   210.4	650.6	313.5	211.9	161.2	381.8	205.8	121.5	53.2	81.0	37.2	17.5	138.8	319.0	171.1	99.2
2050.9   382.4	1186.4	569.2	386.4	293.6	696.6	374.5	222.3	97.0	147.5	68.0	32.3	252.8	582.0	311.5	181.7
2050.10  205.9	640.7	306.2	208.7	158.4	376.3	201.9	120.3	52.4	79.6	36.9	17.7	136.4	314.4	168.0	98.5
2050.11  288.9	902.5	428.9	294.0	222.7	530.5	283.7	170.2	73.9	112.0	52.2	25.4	191.9	443.0	236.2	139.7
2050.12  145.1	453.1	215.5	147.6	111.8	266.3	142.5	85.4	37.1	56.3	26.2	12.7	96.4	222.4	118.6	70.1

2045.1   147.2	458.8	218.7	149.5	113.3	269.6	144.4	86.3	37.5	57.0	26.5	12.8	97.6	225.2	120.2	70.8
2045.2   395.1	1234.2	586.8	402.1	304.6	725.4	388.0	232.7	101.0	153.2	71.3	34.6	262.4	605.8	323.0	190.9
2045.3   307.5	960.8	456.5	313.0	237.1	564.8	301.9	181.2	78.6	119.3	55.6	27.0	204.3	471.7	251.4	148.7
2045.4   235.9	735.2	350.6	239.5	181.6	431.9	231.4	138.3	60.2	91.3	42.4	20.4	156.4	360.8	192.6	113.3
2045.5   274.7	855.6	408.3	278.7	211.4	502.6	269.4	160.9	70.0	106.3	49.3	23.7	182.1	419.9	224.2	131.8
2045.6   264.9	824.2	393.9	268.5	203.7	484.1	259.7	154.8	67.4	102.4	47.4	22.7	175.5	404.4	216.1	126.8
2045.7   157.8	494.4	234.0	161.1	121.8	290.7	155.1	93.5	40.5	61.3	28.7	14.1	105.0	242.8	129.2	76.8
2045.8   210.4	650.6	313.5	211.9	161.2	381.8	205.8	121.5	53.2	81.0	37.2	17.5	138.8	319.0	171.1	99.2
2045.9   382.4	1186.4	569.2	386.4	293.6	696.6	374.5	222.3	97.0	147.5	68.0	32.3	252.8	582.0	311.5	181.7
2045.10  205.9	640.7	306.2	208.7	158.4	376.3	201.9	120.3	52.4	79.6	36.9	17.7	136.4	314.4	168.0	98.5
2045.11  288.9	902.5	428.9	294.0	222.7	530.5	283.7	170.2	73.9	112.0	52.2	25.4	191.9	443.0	236.2	139.7
2045.12  145.1	453.1	215.5	147.6	111.8	266.3	142.5	85.4	37.1	56.3	26.2	12.7	96.4	222.4	118.6	70.1

2040.1   147.2	458.8	218.7	149.5	113.3	269.6	144.4	86.3	37.5	57.0	26.5	12.8	97.6	225.2	120.2	70.8
2040.2   395.1	1234.2	586.8	402.1	304.6	725.4	388.0	232.7	101.0	153.2	71.3	34.6	262.4	605.8	323.0	190.9
2040.3   307.5	960.8	456.5	313.0	237.1	564.8	301.9	181.2	78.6	119.3	55.6	27.0	204.3	471.7	251.4	148.7
2040.4   235.9	735.2	350.6	239.5	181.6	431.9	231.4	138.3	60.2	91.3	42.4	20.4	156.4	360.8	192.6	113.3
2040.5   274.7	855.6	408.3	278.7	211.4	502.6	269.4	160.9	70.0	106.3	49.3	23.7	182.1	419.9	224.2	131.8
2040.6   264.9	824.2	393.9	268.5	203.7	484.1	259.7	154.8	67.4	102.4	47.4	22.7	175.5	404.4	216.1	126.8
2040.7   157.8	494.4	234.0	161.1	121.8	290.7	155.1	93.5	40.5	61.3	28.7	14.1	105.0	242.8	129.2	76.8
2040.8   210.4	650.6	313.5	211.9	161.2	381.8	205.8	121.5	53.2	81.0	37.2	17.5	138.8	319.0	171.1	99.2
2040.9   382.4	1186.4	569.2	386.4	293.6	696.6	374.5	222.3	97.0	147.5	68.0	32.3	252.8	582.0	311.5	181.7
2040.10  205.9	640.7	306.2	208.7	158.4	376.3	201.9	120.3	52.4	79.6	36.9	17.7	136.4	314.4	168.0	98.5
2040.11  288.9	902.5	428.9	294.0	222.7	530.5	283.7	170.2	73.9	112.0	52.2	25.4	191.9	443.0	236.2	139.7
2040.12  145.1	453.1	215.5	147.6	111.8	266.3	142.5	85.4	37.1	56.3	26.2	12.7	96.4	222.4	118.6	70.1

2035.1   147.2	458.8	218.7	149.5	113.3	269.6	144.4	86.3	37.5	57.0	26.5	12.8	97.6	225.2	120.2	70.8
2035.2   395.1	1234.2	586.8	402.1	304.6	725.4	388.0	232.7	101.0	153.2	71.3	34.6	262.4	605.8	323.0	190.9
2035.3   307.5	960.8	456.5	313.0	237.1	564.8	301.9	181.2	78.6	119.3	55.6	27.0	204.3	471.7	251.4	148.7
2035.4   235.9	735.2	350.6	239.5	181.6	431.9	231.4	138.3	60.2	91.3	42.4	20.4	156.4	360.8	192.6	113.3
2035.5   274.7	855.6	408.3	278.7	211.4	502.6	269.4	160.9	70.0	106.3	49.3	23.7	182.1	419.9	224.2	131.8
2035.6   264.9	824.2	393.9	268.5	203.7	484.1	259.7	154.8	67.4	102.4	47.4	22.7	175.5	404.4	216.1	126.8
2035.7   157.8	494.4	234.0	161.1	121.8	290.7	155.1	93.5	40.5	61.3	28.7	14.1	105.0	242.8	129.2	76.8
2035.8   210.4	650.6	313.5	211.9	161.2	381.8	205.8	121.5	53.2	81.0	37.2	17.5	138.8	319.0	171.1	99.2
2035.9   382.4	1186.4	569.2	386.4	293.6	696.6	374.5	222.3	97.0	147.5	68.0	32.3	252.8	582.0	311.5	181.7
2035.10  205.9	640.7	306.2	208.7	158.4	376.3	201.9	120.3	52.4	79.6	36.9	17.7	136.4	314.4	168.0	98.5
2035.11  288.9	902.5	428.9	294.0	222.7	530.5	283.7	170.2	73.9	112.0	52.2	25.4	191.9	443.0	236.2	139.7
2035.12  145.1	453.1	215.5	147.6	111.8	266.3	142.5	85.4	37.1	56.3	26.2	12.7	96.4	222.4	118.6	70.1

2030.1   147.2	458.8	218.7	149.5	113.3	269.6	144.4	86.3	37.5	57.0	26.5	12.8	97.6	225.2	120.2	70.8
2030.2   395.1	1234.2	586.8	402.1	304.6	725.4	388.0	232.7	101.0	153.2	71.3	34.6	262.4	605.8	323.0	190.9
2030.3   307.5	960.8	456.5	313.0	237.1	564.8	301.9	181.2	78.6	119.3	55.6	27.0	204.3	471.7	251.4	148.7
2030.4   235.9	735.2	350.6	239.5	181.6	431.9	231.4	138.3	60.2	91.3	42.4	20.4	156.4	360.8	192.6	113.3
2030.5   274.7	855.6	408.3	278.7	211.4	502.6	269.4	160.9	70.0	106.3	49.3	23.7	182.1	419.9	224.2	131.8
2030.6   264.9	824.2	393.9	268.5	203.7	484.1	259.7	154.8	67.4	102.4	47.4	22.7	175.5	404.4	216.1	126.8
2030.7   157.8	494.4	234.0	161.1	121.8	290.7	155.1	93.5	40.5	61.3	28.7	14.1	105.0	242.8	129.2	76.8
2030.8   210.4	650.6	313.5	211.9	161.2	381.8	205.8	121.5	53.2	81.0	37.2	17.5	138.8	319.0	171.1	99.2
2030.9   382.4	1186.4	569.2	386.4	293.6	696.6	374.5	222.3	97.0	147.5	68.0	32.3	252.8	582.0	311.5	181.7
2030.10  205.9	640.7	306.2	208.7	158.4	376.3	201.9	120.3	52.4	79.6	36.9	17.7	136.4	314.4	168.0	98.5
2030.11  288.9	902.5	428.9	294.0	222.7	530.5	283.7	170.2	73.9	112.0	52.2	25.4	191.9	443.0	236.2	139.7
2030.12  145.1	453.1	215.5	147.6	111.8	266.3	142.5	85.4	37.1	56.3	26.2	12.7	96.4	222.4	118.6	70.1

2025.1   147.2	458.8	218.7	149.5	113.3	269.6	144.4	86.3	37.5	57.0	26.5	12.8	97.6	225.2	120.2	70.8
2025.2   395.1	1234.2	586.8	402.1	304.6	725.4	388.0	232.7	101.0	153.2	71.3	34.6	262.4	605.8	323.0	190.9
2025.3   307.5	960.8	456.5	313.0	237.1	564.8	301.9	181.2	78.6	119.3	55.6	27.0	204.3	471.7	251.4	148.7
2025.4   235.9	735.2	350.6	239.5	181.6	431.9	231.4	138.3	60.2	91.3	42.4	20.4	156.4	360.8	192.6	113.3
2025.5   274.7	855.6	408.3	278.7	211.4	502.6	269.4	160.9	70.0	106.3	49.3	23.7	182.1	419.9	224.2	131.8
2025.6   264.9	824.2	393.9	268.5	203.7	484.1	259.7	154.8	67.4	102.4	47.4	22.7	175.5	404.4	216.1	126.8
2025.7   157.8	494.4	234.0	161.1	121.8	290.7	155.1	93.5	40.5	61.3	28.7	14.1	105.0	242.8	129.2	76.8
2025.8   210.4	650.6	313.5	211.9	161.2	381.8	205.8	121.5	53.2	81.0	37.2	17.5	138.8	319.0	171.1	99.2
2025.9   382.4	1186.4	569.2	386.4	293.6	696.6	374.5	222.3	97.0	147.5	68.0	32.3	252.8	582.0	311.5	181.7
2025.10  205.9	640.7	306.2	208.7	158.4	376.3	201.9	120.3	52.4	79.6	36.9	17.7	136.4	314.4	168.0	98.5
2025.11  288.9	902.5	428.9	294.0	222.7	530.5	283.7	170.2	73.9	112.0	52.2	25.4	191.9	443.0	236.2	139.7
2025.12  145.1	453.1	215.5	147.6	111.8	266.3	142.5	85.4	37.1	56.3	26.2	12.7	96.4	222.4	118.6	70.1

2020.1   147.2	458.8	218.7	149.5	113.3	269.6	144.4	86.3	37.5	57.0	26.5	12.8	97.6	225.2	120.2	70.8
2020.2   395.1	1234.2	586.8	402.1	304.6	725.4	388.0	232.7	101.0	153.2	71.3	34.6	262.4	605.8	323.0	190.9
2020.3   307.5	960.8	456.5	313.0	237.1	564.8	301.9	181.2	78.6	119.3	55.6	27.0	204.3	471.7	251.4	148.7
2020.4   235.9	735.2	350.6	239.5	181.6	431.9	231.4	138.3	60.2	91.3	42.4	20.4	156.4	360.8	192.6	113.3
2020.5   274.7	855.6	408.3	278.7	211.4	502.6	269.4	160.9	70.0	106.3	49.3	23.7	182.1	419.9	224.2	131.8
2020.6   264.9	824.2	393.9	268.5	203.7	484.1	259.7	154.8	67.4	102.4	47.4	22.7	175.5	404.4	216.1	126.8
2020.7   157.8	494.4	234.0	161.1	121.8	290.7	155.1	93.5	40.5	61.3	28.7	14.1	105.0	242.8	129.2	76.8
2020.8   210.4	650.6	313.5	211.9	161.2	381.8	205.8	121.5	53.2	81.0	37.2	17.5	138.8	319.0	171.1	99.2
2020.9   382.4	1186.4	569.2	386.4	293.6	696.6	374.5	222.3	97.0	147.5	68.0	32.3	252.8	582.0	311.5	181.7
2020.10  205.9	640.7	306.2	208.7	158.4	376.3	201.9	120.3	52.4	79.6	36.9	17.7	136.4	314.4	168.0	98.5
2020.11  288.9	902.5	428.9	294.0	222.7	530.5	283.7	170.2	73.9	112.0	52.2	25.4	191.9	443.0	236.2	139.7
2020.12  145.1	453.1	215.5	147.6	111.8	266.3	142.5	85.4	37.1	56.3	26.2	12.7	96.4	222.4	118.6	70.1

2015.1   0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
2015.2   0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
2015.3   0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
2015.4   0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
2015.5   0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
2015.6   0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
2015.7   0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
2015.8   0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
2015.9   0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
2015.10  0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
2015.11  0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
2015.12  0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
;

TABLE
NTpipe_initial(z,z1) 'Initial number of pipelines connecting zone z to z1 (at y=1)'
    1     2     3     4     5     6     7     8     9     10    11    12       
1   0     0     0     0     0     0     0     0     0     0     0     0     
2   0     0     0     0     0     0     0     0     0     0     0     0    
3   0     0     0     0     0     0     0     0     0     0     0     0     
4   0     0     0     0     0     0     0     0     0     0     0     0    
5   0     0     0     0     0     0     0     0     0     0     0     0     
6   0     0     0     0     0     0     0     0     0     0     0     0     
7   0     0     0     0     0     0     0     0     0     0     0     0     
8   0     0     0     0     0     0     0     0     0     0     0     0     
9   0     0     0     0     0     0     0     0     0     0     0     0     
10  0     0     0     0     0     0     0     0     0     0     0     0    
11  0     0     0     0     0     0     0     0     0     0     0     0     
12  0     0     0     0     0     0     0     0     0     0     0     0 
;

TABLE
PCAPmin(z,p)'Minimum production capacity of production technology p in zone z [MW]'
    SMRCCS    ONWTE    OFFWTE NATGAS
1   16.4      0.05      0.14  0
2   16.4      0.05      0.14  0
3   16.4      0.05      0.14  0
4   16.4      0.05      0.14  0
5   16.4      0.05      0.14  0
6   16.4      0.05      0.14  0
7   16.4      0.05      0.14  0
8   16.4      0.05      0.14  0
9   16.4      0.05      0.14  0
10  16.4      0.05      0.14  0
11  16.4      0.05      0.14  0
12  16.4      0.05      0.14  0
;


TABLE
PCAPmax(z,p)'Maximum production capacity of production technology p in zone z [MW]'
    SMRCCS ONWTE   OFFWTE  NATGAS
1   246     2.86    8.59   0
2   246     2.86    8.59   0
3   246     2.86    8.59   0
4   246     2.86    8.59   0
5   246     2.86    8.59   0
6   246     2.86    8.59   0
7   246     2.86    8.59   0
8   246     2.86    8.59   0
9   246     2.86    8.59   0
10  246     2.86    8.59   0
11  246     2.86    8.59   0
12  246     2.86    8.59   0
;

TABLE
PFeas(z,p)'1 if zone z can support production facility p, 0 otherwise'
    SMRCCS ONWTE  OFFWTE  NATGAS
1   1      1      1       0
2   1      1      1       0
3   1      1      1       0
4   1      1      1       0
5   1      1      0       0
6   1      1      1       0
7   0      0      0       0
8   0      0      0       0
9   1      1      1       0
10  1      1      1       0
11  1      1      1       0
12  1      1      1       0
;

TABLE
PRDCAP_initial(z,p) 'Initial total production capacity of facility p in zone z (at y=1)'
   SMRCCS ONWTE  OFFWTE  NATGAS
1   0      0      0      100000000
2   0      0      0      100000000
3   0      0      0      100000000
4   0      0      0      100000000
5   0      0      0      100000000
6   0      0      0      100000000
7   0      0      0      100000000
8   0      0      0      100000000
9   0      0      0      100000000
10  0      0      0      100000000
11  0      0      0      100000000
12  0      0      0      100000000
;

TABLE
SFeas(z,s)'1 if zone z can support production facility p, 0 otherwise'
    SALTCAVERNS SVESSEL MVESSEL LVESSEL
1   0           1       1       1
2   0           1       1       1 
3   0           1       1       1
4   0           1       1       1
5   0           1       1       1
6   0           1       1       1
7   0           1       1       1
8   0           1       1       1
9   0           1       1       1
10  0           1       1       1
11  0           1       1       1
12  0           1       1       1      
;

TABLE
STRCAP_initial(z,s) 'Initial total storage capacity of facility s in zone z (at y=1) [MWh]'
    SALTCAVERNS    SVESSEL    MVESSEL    LVESSEL  
1   0              0          0          0
2   2372944        0          0          0
3   14773764       0          0          0
4   0              0          0          0
5   0              0          0          0
6   0              0          0          0
7   0              0          0          0
8   0              0          0          0
9   870528         0          0          0
10  0              0          0          0
11  0              0          0          0
12  0              0          0          0
;

TABLE
QTCAPpipe(z,z1) 'Max flow capacity of pipeline between z and z1 [MW]'
       1        2        3        4        5        6        7        8        9       10       11       12
1   0.00      633      633      633      633      633      633      633      633      633      633      633     
2    633     0.00      633      633      633      633      633      633      633      633      633      633     
3    633      633     0.00      633      633      633      633      633      633      633      633      633
4    633      633      633     0.00      633      633      633      633      633      633      633      633
5    633      633      633      633     0.00      633      633      633      633      633      633      633
6    633      633      633      633      633     0.00      633      633      633      633      633      633
7    633      633      633      633      633      633     0.00      633      633      633      633      633
8    633      633      633      633      633      633      633     0.00      633      633      633      633
9    633      633      633      633      633      633      633      633     0.00      633      633      633
10   633      633      633      633      633      633      633      633      633     0.00      633      633
11   633      633      633      633      633      633      633      633      633      633     0.00      633
12   633      633      633      633      633      633      633      633      633      633      633     0.00   
;

Table
PRDfactor(h,p) 'Variation of production per time slice'

        SMRCCS  ONWTE   OFFWTE  NATGAS
1	1	0.36	0.39	1
2	1	0.42	0.45	1
3	1	0.38	0.41	1
4	1	0.37	0.4	1
5	1	0.23	0.26	1
6	1	0.38	0.41	1
7	1	0.35	0.38	1
8	1	0.23	0.26	1
9	1	0.13	0.16	1
10	1	0.25	0.28	1
11	1	0.28	0.31	1
12	1	0.23	0.26	1
13	1	0.26	0.29	1
14	1	0.33	0.36	1
15	1	0.3	0.33	1
16	1	0.26	0.29	1
;

Table
PCC(p,y) 'Learning curve for Capex of production facilities [£mn/MW HHV H2]'
	        2020	2025	2030	2035	2040	2045	2050
SMRCCS     	1.021	0.959	0.899	0.843	0.791	0.743	0.697
ONWTE	        3.405	2.523	1.970	1.616	1.333	1.135	0.979
OFFWTE   	5.208	3.750	3.611	3.576	3.542	3.535	3.528
NATGAS          0       0       0       0       0       0       0 
;

Parameter
AreaONWT(z) 'Area in km2 available for onshore wind turbines'
/1   194.81
 2   275.45
 3   335.71
 4   327.73
 5   474.53
 6   426.61
 7   0
 8   36.8
 9   404.60
 10  567.59
 11  789.89
 12  365.51 /

Duration(h) 'Proportion of time slice per year'
/1   0.073
 2   0.104
 3   0.031
 4   0.042
 5   0.073
 6   0.104
 7   0.031
 8   0.042
 9   0.073
 10  0.104
 11  0.031
 12  0.042
 13  0.073
 14  0.104
 15  0.031
 16  0.042 /


StoreMin(s) 'Minimum storage in each s tech'
/SALTCAVERNS   0.03
 SVESSEL       0
 MVESSEL       0
 LVESSEL       0/

ProduceMin(p) 'Minimum proportion of production capacity which must be produced'
/ SMRCCS 0.3
 ONWTE   0.3
 OFFWTE  0.3
 NATGAS  0/

SCAPmin(s) 'Minimum storage capacity of storage facility s [MWh]'
/SALTCAVERNS   0
 SVESSEL       19
 MVESSEL       242
 LVESSEL       13444/

SCAPmax(s) 'Maximum storage capacity of storage facility s [MWh]'
/SALTCAVERNS  1000000
 SVESSEL       363
 MVESSEL       3630
 LVESSEL       36300/

CarbonEmission(p) 'Carbon emission [TonneCo2/mwh]'
/ SMRCCS  0.02736
  ONWTE   0
  OFFWTE  0
  NATGAS  0.184/

POC(p) 'Operating cost of production facility p [£mn/MW]'
/ SMRCCS 0.2994
 ONWTE   0.2297
 OFFWTE  0.2705
 NATGAS  0 /

SCC(s) 'Capital cost of storage facility [£mn/mwh]'
/  SALTCAVERNS 0
   SVESSEL     0.00112
   MVESSEL     0.000646
   LVESSEL     0.000372 /

SOC(s) 'Operating cost of storage facility s per unit MWh [£mn/MWh]'
/  SALTCAVERNS 0.000000419
   SVESSEL     0.000002380
   MVESSEL     0.000004759
   LVESSEL     0.000015230 /

NTtruck_initial(z) 'Initial number of trucks in zone z (at y=1)'
/1   0
 2   0
 3   0
 4   0
 5   0
 6   0
 7   0
 8   0
 9   0
 10  0
 11  0
 12  0/
;

SCALARS
LUTime 'Loading and unloading time [h]' / 2/
Ma 'Big M parameter' / 30000 /
QTCAPtruck 'Capacity of truck [MWh]' / 26.38/
r 'Discount rate' /0.07/
TCCpipe 'Capital cost of installing 1 unit of pipeline per unit of length [£mn/ km]' / 0.360/
TCCtruck 'Capital cost of installing 1 unit of truck+trailer [£mn/ unit]' / 0.61311/
TOCpipe 'Operating cost per unit of hyrogen transported per unit length of pipeline [£/MW*km]' / 0.000005/
TOCtrucka 'Operating cost of truck per unit [£mn/ unit]' /0.01658/
TOCtruckb 'Operating cost of truck per unit distance travelled [£mn/ km]' /3.36E-06 /
TruckAvgSpeed 'Average speed of truck on the road [km/h]' / 50/
TruckOpTime 'Operational time of truck per planning period [h]' / 25000/
MaxNTItruck 'Maximum number of trucks that can be installed in one planning period' / 300/
NATGASPRICE 'price of natural gas per mwh'/ 0.00003/
RadiusONWT 'Radius of onshore wind turbine [km]' / 0.050/
targetemission 'Target co2 reduction as fraction of 2015 emission by 2050' /0.05/
ELECPRICE 'Price of electricity [£mn/MWh]' / 145e-6/
;

EQUATIONS
MB1(z,y,h) 'Material balance 1'

Production2a(z,p,y,h)   'Maximium capacity in zone z is not to be exceeded in a given planning period'
Production2b(z,p,y,h)   'Lower bound constraint on production based on production capacity'
Production2c(z,p,h)     'Ensures production is 0 at y=2015'
Production3a(z,p,y)     'Assigns initial total production capacity of facility p at y=1'
Production3b(z,p,y)     'How much total production capacity of facility p is increased in each zone from one planning period to the next'
Production4a(z,p,y)     'Number of production facilities p installed'
Production4b(z,p,y)     'Number of production facilities p installed'
Production5(z,p,y)      'Some zone can support certain production facilities'
Production6(z,p)        'Area constraint for production of onshore wind turbine'
ProductionEa(z,p,y,h)   'Flowrate used by wind turbines for electricity grid'
ProductionEb(z,y,h)     'SMRCCS cannot be used for electricity grid'
ProductionEc(z,y,h)     'Natural gas cannot be used for electricity grid'       
ProductionEd(z,p,y,h)

Transmission6(z,z1,y,h)   'Flow only in one direction through each pipeline'
Transmission7(z,z1,y,h)   'Enforces no flow from one zone to itself'
Transmission8a(z,z1,y,h)  'Whether there is flow of hydrogen between 2 zones via pipeline'
Transmission8b(z,z1,y,h)  'Whether there is flow of hydrogen between 2 zones via pipeline'
Transmission9(z,z1,y,h)   'Hydrogen flowrate bounded by pipeline capacity'
Transmission10a(z,z1,y)   'Assigns initial number of pipelines installed at y=1'
Transmission10b(z,z1,y)   'Additional number of pipelines connecting zones z and z1 that need to be installed at planning period y'
Transmission11(z,z1,y)    'To ensure pipe can be used in either direction'

Transmission12(z,z1,y,h)  'Flowrate transported between zone z and z1 by truck'
Transmission13a(z,y,h)    'Number of trucks needed to transport hydrogen from zone z to z1'
Transmission13b(z,y,h)    'Number of trucks needed to transport hydrogen from zone z to z1'
Transmission14a(z,y)      'Assigns initial number of trucks installed at y=1' 
Transmission14b(z,y)      'Additional number of trucks that need to be installed in zone z at planning period y'
Transmission15(z,y)       'Maximum number of trucks that can be installed at one go'

Storage15a(z,s,y,h)   'Setting stored gas at y=1 to 0 since no production at first planning period'
Storage15b(z,s,y)     'Balanced of stored gas between time slices for h=1'  
Storage15c(z,s,y,h)   'Balanced of stored gas between time slices'
Storage15d(z,s,y)     'Final storage volume at last year and last time slice'
Storage16(z,s,y,h)    'Hydrogen is either added or removed'
Storage17a(z,s,y,h)   'Make inflows zero, if outflow non zero'
Storage17b(z,s,y,h)   'Make inflows zero, if outflow non zero'
Storage18a(z,s,y,h)   'Make inflows zero, if outflow non zero'
Storage18b(z,s,y,h)   'Make inflows zero, if outflow non zero'
Storage18c(z,s,y,h)
Storage18d(z,s,y,h)
*Storage19a(z,s,y,h)   'Minimum storage and max storage'
Storage19a2(z,s,y,h)   'Minimum storage and max storage'
Storage19b(z,s,y)     'Bound for final storage volume'
Storage20a(z,s,y)     'Assigns initial storage capacity of facility s at y=1'
Storage20b(z,s,y)     'How much total storage capacity of facility s is increased in each zone from one planning period to the next'
Storage21a(z,s,y)     'Find number of storage facilities installed'
Storage21b(z,s,y)     'Find number of storage facilities installed'
Storage22(z,s,y)      'Only some zones have feasible zones for storage'

Cost23(y)    'Capex for production'
Cost24(y)    'Opex for production'
Cost25(y)    'Capex for transport via pipeline'
Cost26(y)    'OPEX for transport via pipeline'
Cost27(y)    'Capex for new storage'
Cost28(y)    'OPEX for storage'

Obj29(y)   'Total cost for planning period y'
Obj30      'Total discounted cost'
Carbon31(y)   'Carbon emission per year'
Carbon32(y)   'Carbon cap'
Carbon33(y) 'carbon cap'

Dax33(p)  'show'
Dax34(p,y) 'Show'
Dax35(p,y,h) 'show'
Dax36(s,y,h)    'show'
Dax37(z,z1,y,h) 'show'
Dax38(y) 'show'
Dax39(y) 'show'
Dax40(y) 'show'
*Dax41(y,p) 'show'
*Dax42(y,p) 'show'
*Dax43(y)   'show'
DemandSum(y)
;

MB1(z,y,h).. sum(z1,(QTpipe(z1,z,y,h)-QTpipe(z,z1,y,h)))+
             sum(z1,(QTtruck(z1,z,y,h)-QTtruck(z,z1,y,h)))+
             sum(p,PRD(z,p,y,h))+
             sum(s,(QSout(z,s,y,h)-QSin(z,s,y,h)))-Demand(y,z,h) =e= 0;

Production2a(z,p,y,h)..                PRD(z,p,y,h) =l= PRDCAP(z,p,y)*PRDfactor(h,p);
Production2b(z,p,y,h)..                PRD(z,p,y,h) =g= ProduceMin(p)*PRDCAP(z,p,y)*PRDfactor(h,p);
Production2c(z,p,h)..                  PRD(z,p,'2015',h) =e= 0;
Production3a(z,p,y)$(ord(y) eq 1)..    PRDCAP(z,p,y) =e= PRDCAP_initial(z,p);
Production3b(z,p,y)$(ord(y) gt 1)..    PRDCAP(z,p,y) =e= PRDCAP(z,p,y-1)+PRDCAPI(z,p,y);
Production4a(z,p,y)..                  NPI(z,p,y)*PCAPmin(z,p) =l= PRDCAPI(z,p,y);
Production4b(z,p,y)..                  NPI(z,p,y)*PCAPmax(z,p) =g= PRDCAPI(z,p,y);
Production5(z,p,y)..                   NPI(z,p,y) =l= PFeas(z,p)*Ma;
Production6(z,'ONWTE')..               sum(y,2*sqrt(3)*(power(5*RadiusONWT,2))*NPI(z,'ONWTE',y)) =l= AreaONWT(z);
ProductionEa(z,p,y,h)..                ELECGRID(z,p,y,h)*0.72 =l= (PRDCAP(z,p,y)*PRDfactor(h,p) - PRD(z,p,y,h));
ProductionEb(z,y,h)..                  ELECGRID(z,'SMRCCS',y,h) =e= 0;              
ProductionEc(z,y,h)..                  ELECGRID(z,'NATGAS',y,h) =e= 0;              
ProductionEd(z,p,y,h)..                ELECGRID(z,p,y,h)=l= PRDCAP(z,p,y)*0.07;

Transmission6(z,z1,y,h)..                     X(z,z1,y,h)+X(z1,z,y,h) =l= 1;
Transmission7(z,z1,y,h)$(ord(z) eq ord(z1)).. X(z,z1,y,h) =e= 0;
Transmission8a(z,z1,y,h)..                    X(z,z1,y,h)/Ma =l= QTpipe(z,z1,y,h);
Transmission8b(z,z1,y,h)..                    QTpipe(z,z1,y,h) =l= X(z,z1,y,h)*Ma;
Transmission9(z,z1,y,h)..                     QTpipe(z,z1,y,h) =l= NTpipe(z,z1,y)*QTCAPpipe(z,z1);
Transmission10a(z,z1,y)$(ord(y) eq 1)..       NTpipe(z,z1,y) =e= NTpipe_initial(z,z1);
Transmission10b(z,z1,y)$(ord(y) gt 1)..       NTpipe(z,z1,y) =e= NTpipe(z,z1,y-1)+NTIpipe(z,z1,y);
Transmission11(z,z1,y)..                      NTIpipe(z,z1,y)-NTIpipe(z1,z,y) =e= 0;

Transmission12(z,z1,y,h)..              QTtruck(z,z1,y,h) =e= (floor(TruckOpTime/((2*RoadDistance(z,z1)/TruckAvgSpeed)+LUTime)))*(VTtruck(z,z1,y,h)/(5*8760*Duration(h)));
Transmission13a(z,y,h)..                sum(z1,VTtruck(z,z1,y,h)) =l= NTtruck(z,y)*QTCAPtruck;
Transmission13b(z,y,h)..                sum(z1,VTtruck(z,z1,y,h)) =g= 0;
Transmission14a(z,y)$(ord(y) eq 1)..    NTtruck(z,y) =e= NTtruck_initial(z);
Transmission14b(z,y)$(ord(y) gt 1)..    NTtruck(z,y) =e= NTtruck(z,y-1) + NTItruck(z,y);
Transmission15(z,y)..                   NTItruck(z,y) =l= MaxNTItruck;

Storage15a(z,s,y,h)..                    Store(z,s,'2015','1') =e= 0;
Storage15b(z,s,y)$(ord(y) gt 1)..        Store(z,s,y,'1') =e= Store(z,s,y-1,'16') + (QSin(z,s,y-1,'16')-QSout(z,s,y-1,'16'))*5*8760*Duration('16');
Storage15c(z,s,y,h)$(ord(h) gt 1)..      Store(z,s,y,h) =e= Store(z,s,y,h-1)+ (QSin(z,s,y,h-1)- QSout(z,s,y,h-1))*5*8760*Duration(h-1);
Storage15d(z,s,y)$(ord(y) eq 8)..        StoreF(z,s) =e= Store(z,s,y,'16')+ (QSin(z,s,y,'16')- QSout(z,s,y,'16'))*5*8760*Duration('16'); 
Storage16(z,s,y,h)..                     SIN(z,s,y,h)+SOUT(z,s,y,h) =l= 1;
Storage17a(z,s,y,h)..                    SIN(z,s,y,h)/Ma =l=QSin(z,s,y,h);
Storage17b(z,s,y,h)..                    SIN(z,s,y,h)*Ma =g= QSin(z,s,y,h);
Storage18a(z,s,y,h)..                    SOUT(z,s,y,h)/Ma =l= QSout(z,s,y,h);
Storage18b(z,s,y,h)..                    SOUT(z,s,y,h)*Ma =g= QSout(z,s,y,h);
Storage18c(z,s,y,h)..                    QSin(z,s,y,h) =l= 2000;
Storage18d(z,s,y,h)..                    QSout(z,s,y,h) =l= 2000;
*Storage19a(z,s,y,h)..                    Store(z,s,y,h) =g= StoreMin(s)*STRCAP(z,s,y);
Storage19a2(z,s,y,h)..                   Store(z,s,y,h) =l= STRCAP(z,s,y);
Storage19b(z,s,y)$(ord(y) eq 8)..        StoreF(z,s) =l= STRCAP(z,s,y); 
Storage20a(z,s,y)$(ord(y) eq 1)..        STRCAP(z,s,y) =e= STRCAP_initial(z,s);
Storage20b(z,s,y)$(ord(y) gt 1)..        STRCAP(z,s,y) =e= STRCAP(z,s,y-1)+STRCAPI(z,s,y);
Storage21a(z,s,y)..                      NSI(z,s,y)*SCAPmin(s) =l= STRCAPI(z,s,y);
Storage21b(z,s,y)..                      NSI(z,s,y)*SCAPmax(s) =g= STRCAPI(z,s,y);
Storage22(z,s,y)..                       NSI(z,s,y) =l= SFeas(z,s)*Ma;

Cost23(y)..      CAPEXP(y) =e= sum((p,z),PRDCAPI(z,p,y)*PCC(p,y));
Cost24(y)..      OPEXP(y) =e= sum((z,p,h),PRD(z,p,y,h)*POC(p))+
                              sum((z,h),NATGASPRICE*PRD(z,'NATGAS',y,h)*Duration(h)*5*8760)-
                              sum((z,p,h),ELECGRID(z,p,y,h)*Duration(h)*5*8750*ELECPRICE);
Cost25(y)..      CAPEXT(y) =e= sum((z,z1),0.5*NTIpipe(z,z1,y)*TCCpipe*Distance(z,z1))+
                               sum((z,z1),NTItruck(z,y)*TCCtruck );
Cost26(y)..      OPEXT(y) =e= sum((z,z1,h),QTpipe(z,z1,y,h)*TOCpipe*Distance(z,z1))+
                              sum((z,z1),NTtruck(z,y)*(TOCtrucka + TOCtruckb*floor(TruckOpTime/((2*RoadDistance(z,z1)/TruckAvgSpeed)+LUTime))*2*RoadDistance(z,z1)));
Cost27(y)..      CAPEXS(y) =e= sum((z,s),STRCAPI(z,s,y)*SCC(s));
Cost28(y)..      OPEXS(y) =e= sum((z,s,h),Store(z,s,y,h)*SOC(s));
Obj29(y)..       TC(y) =e= CAPEXP(y)+OPEXP(y)+CAPEXT(y)+OPEXT(y)+CAPEXS(y)+OPEXS(y);

Obj30..      TDC =e= sum(y,TC(y)/power((1+r),(y.val-2015)));
Carbon31(y)..   Emission(y)=e=sum((p,z,h),CarbonEmission(p)*PRD(z,p,y,h)*Duration(h)*8760*5);
Carbon32(y)..   Emission(y) =l= 26937037.5-EReduction(y);
Carbon33(y)..   EReduction(y)=e= (1-targetemission)*26937037.5*(y.val-2015)/35;
Dax33(p)..     PRDSHOW(p) =e= sum((z,y,h),PRD(z,p,y,h));
Dax34(p,y)..     PRDYEAR(p,y) =e= sum((z,h),PRD(z,p,y,h));
Dax35(p,y,h)$(ord(y) eq 8)..     PRDH(p,h) =e= sum(z,PRD(z,p,y,h));
Dax36(s,y,h)$(ord(y) eq 8)..     StoreH(s,h) =e= sum(z,Store(z,s,y,h));
Dax37(z,z1,y,h)$(ord(y) eq 8)..     PipeH(z,z1,y,h) =e= QTpipe(z,z1,y,h);

Dax38(y)..   QSinTotal(y)=e=Sum((z,s,h),QSin(z,s,y,h));
Dax39(y)..   QSoutTotal(y)=e=Sum((z,s,h),QSout(z,s,y,h));
Dax40(y)..   StoreY(y)=e=sum((z,s,h),Store(z,s,y,h));
*Dax41(y,p)..   PRDCAPISUM(y,p)=e=sum(z,PRDCAPI(z,p,y));
*Dax42(y,p)..   NPISUM(y,p)=e=sum(z,NPI(z,p,y));
*Dax43(y)..   NTIpipeSum(y)=e= sum((z,z1),NTIpipe(z,z1,y))
DemandSum(y).. TotalDemand(y)=e=sum((z,h),Demand(y,z,h));



MODEL    model_elec_v6_005      /All/;

OPTION MIP = Cplex;
OPTION OPTCR = 0.001;
OPTION intVarUp=0;
*model_elec_v4_00.OPTFILE=1
SOLVE    model_elec_v6_005  USING MIP MINIMIZING TDC;


Execute_Unload "model_elec_v6_005.gdx",Emission, TC,ELECGRID,NTIpipeSum,NPI, PRDCAPISUM,StoreY,QSinTotal,QSoutTotal,PRDCAPI, CAPEXP, CAPEXT, CAPEXS, OPEXP, OPEXT, OPEXS,PRDSHOW,PRDYEAR,StoreH,PipeH,PRD,QSin,QSout,QTtruck,QTpipe,Store,NPI,NSI,NTIpipe,NTItruck,TDC;

display DemandSum.m,ProductionEd.m,MB1.m,Carbon33.m, Carbon32.m, Carbon31.m,Emission.m,PRD.l, Store.l,NTItruck.l,NTIpipe.l, QSout.l, STRCAPI.l,TDC.l,NSI.l, NPI.l, QSin.l,PRDSHOW.l,CAPEXP.l,CAPEXT.l,ELECGRID.l;
