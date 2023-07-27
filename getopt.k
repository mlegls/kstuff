\d getopt
ARGV:();OPTIND:-1;OPTARG:"";_ARG:"";
clear:{OPTIND::-1;OPTARG::"";_ARG::"";`done}
nextsw:{$[#_ARG;_ARG
  -1=OPTIND-#ARGV;`done
  ^oi:(*'(OPTIND+1)_ARGV)?"-";:`done
  _ARG::1_ARGV@OPTIND::OPTIND+oi+1]}
getopt:{[spec]$[`done~nextsw[];:`done;];
  s:*_ARG;_ARG::1_ _ARG
  $[^i:spec?s;`err@"unknown opt"
    ~":"=spec[i+1];[OPTARG::""]
    #_ARG;[OPTARG::_ARG;_ARG::""]
    OPTARG::ARGV[OPTIND::OPTIND+1]];s}
\d .
