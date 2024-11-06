session server;

/* Start checking for existence of each input table */
exists0=doesTableExist("CASUSER(bintang.muhammad@student.umn.ac.id)", "CROP PRODUCTION DATA");
if exists0 == 0 then do;
  print "Table "||"CASUSER(bintang.muhammad@student.umn.ac.id)"||"."||"CROP PRODUCTION DATA" || " does not exist.";
  print "UserErrorCode: 100";
  exit 1;
end;
print "Input table: "||"CASUSER(bintang.muhammad@student.umn.ac.id)"||"."||"CROP PRODUCTION DATA"||" found.";
/* End checking for existence of each input table */


  _dp_inputTable="CROP PRODUCTION DATA";
  _dp_inputCaslib="CASUSER(bintang.muhammad@student.umn.ac.id)";

  _dp_outputTable="9c84c627-a6cf-4a26-8806-94eb69a4b7af";
  _dp_outputCaslib="CASUSER(bintang.muhammad@student.umn.ac.id)";

dataStep.runCode result=r status=rc / code='/* BEGIN data step with the output table                                           data */
data "9c84c627-a6cf-4a26-8806-94eb69a4b7af" (caslib="CASUSER(bintang.muhammad@student.umn.ac.id)" label="82200 Bintang Muhammad Ramdhan" promote="no");

    length
       "State"n varchar(16)
    ;
    label
        "State"n=""
    ;
    format
        "State"n 16.
    ;

    /* Set the input                                                                set */
    set "CROP PRODUCTION DATA" (caslib="CASUSER(bintang.muhammad@student.umn.ac.id)"   rename=("StateName"n = "State"n)  drop="KHARIFSORGHUMAREA(1000ha)"n  drop="KHARIFSORGHUMPRODUCTION(1000tons)"n  drop="KHARIFSORGHUMYIELD(Kgperha)"n  drop="RABISORGHUMAREA(1000ha)"n  drop="RABISORGHUMPRODUCTION(1000tons)"n  drop="RABISORGHUMYIELD(Kgperha)"n  drop="SORGHUMAREA(1000ha)"n  drop="SORGHUMPRODUCTION(1000tons)"n  drop="SORGHUMYIELD(Kgperha)"n  drop="PEARLMILLETAREA(1000ha)"n  drop="PEARLMILLETPRODUCTION(1000tons)"n  drop="PEARLMILLETYIELD(Kgperha)"n  drop="MAIZEAREA(1000ha)"n  drop="MAIZEPRODUCTION(1000tons)"n  drop="MAIZEYIELD(Kgperha)"n  drop="FINGERMILLETAREA(1000ha)"n  drop="FINGERMILLETPRODUCTION(1000tons)"n  drop="FINGERMILLETYIELD(Kgperha)"n  drop="BARLEYAREA(1000ha)"n  drop="BARLEYPRODUCTION(1000tons)"n  drop="BARLEYYIELD(Kgperha)"n  drop="CHICKPEAAREA(1000ha)"n  drop="CHICKPEAPRODUCTION(1000tons)"n  drop="CHICKPEAYIELD(Kgperha)"n  drop="PIGEONPEAAREA(1000ha)"n  drop="PIGEONPEAPRODUCTION(1000tons)"n  drop="PIGEONPEAYIELD(Kgperha)"n  drop="MINORPULSESAREA(1000ha)"n  drop="MINORPULSESPRODUCTION(1000tons)"n  drop="MINORPULSESYIELD(Kgperha)"n  drop="GROUNDNUTAREA(1000ha)"n  drop="GROUNDNUTPRODUCTION(1000tons)"n  drop="GROUNDNUTYIELD(Kgperha)"n  drop="SESAMUMAREA(1000ha)"n  drop="SESAMUMPRODUCTION(1000tons)"n  drop="SESAMUMYIELD(Kgperha)"n  drop="RAPESEEDANDMUSTARDAREA(1000ha)"n  drop="RAPESEEDANDMUSTARDPRODUCTION(1000tons)"n  drop="RAPESEEDANDMUSTARDYIELD(Kgperha)"n  drop="SAFFLOWERAREA(1000ha)"n  drop="SAFFLOWERPRODUCTION(1000tons)"n  drop="SAFFLOWERYIELD(Kgperha)"n  drop="CASTORAREA(1000ha)"n  drop="CASTORPRODUCTION(1000tons)"n  drop="CASTORYIELD(Kgperha)"n  drop="LINSEEDAREA(1000ha)"n  drop="LINSEEDPRODUCTION(1000tons)"n  drop="LINSEEDYIELD(Kgperha)"n  drop="SUNFLOWERAREA(1000ha)"n  drop="SUNFLOWERPRODUCTION(1000tons)"n  drop="SUNFLOWERYIELD(Kgperha)"n  drop="SOYABEANAREA(1000ha)"n  drop="SOYABEANPRODUCTION(1000tons)"n  drop="SOYABEANYIELD(Kgperha)"n  drop="OILSEEDSAREA(1000ha)"n  drop="OILSEEDSPRODUCTION(1000tons)"n  drop="OILSEEDSYIELD(Kgperha)"n  drop="SUGARCANEAREA(1000ha)"n  drop="SUGARCANEPRODUCTION(1000tons)"n  drop="SUGARCANEYIELD(Kgperha)"n  drop="COTTONAREA(1000ha)"n  drop="COTTONPRODUCTION(1000tons)"n  drop="COTTONYIELD(Kgperha)"n  drop="FRUITSAREA(1000ha)"n  drop="VEGETABLESAREA(1000ha)"n  drop="FRUITSANDVEGETABLESAREA(1000ha)"n  drop="POTATOESAREA(1000ha)"n  drop="ONIONAREA(1000ha)"n  drop="FODDERAREA(1000ha)"n );

/* END data step                                                                    run */
run;
';
if rc.statusCode != 0 then do;
  print "Error executing datastep";
  exit 2;
end;
  _dp_inputTable="9c84c627-a6cf-4a26-8806-94eb69a4b7af";
  _dp_inputCaslib="CASUSER(bintang.muhammad@student.umn.ac.id)";

  _dp_outputTable="CROP PRODUCTION DATA_82200";
  _dp_outputCaslib="CASUSER(bintang.muhammad@student.umn.ac.id)";

srcCasTable="9c84c627-a6cf-4a26-8806-94eb69a4b7af";
srcCasLib="CASUSER(bintang.muhammad@student.umn.ac.id)";
tgtCasTable="CROP PRODUCTION DATA_82200";
tgtCasLib="CASUSER(bintang.muhammad@student.umn.ac.id)";
saveType="sashdat";
tgtCasTableLabel="82200 Bintang Muhammad Ramdhan";
replace=1;
saveToDisk=1;

exists = doesTableExist(tgtCasLib, tgtCasTable);
if (exists !=0) then do;
  if (replace == 0) then do;
    print "Table already exists and replace flag is set to false.";
    exit ({severity=2, reason=5, formatted="Table already exists and replace flag is set to false.", statusCode=9});
  end;
end;

if (saveToDisk == 1) then do;
  /* Save will automatically save as type represented by file ext */
  saveName=tgtCasTable;
  if(saveType != "") then do;
    saveName=tgtCasTable || "." || saveType;
  end;
  table.save result=r status=rc / caslib=tgtCasLib name=saveName replace=replace
    table={
      caslib=srcCasLib
      name=srcCasTable
    };
  if rc.statusCode != 0 then do;
    return rc.statusCode;
  end;
  tgtCasPath=dictionary(r, "name");

  dropTableIfExists(tgtCasLib, tgtCasTable);
  dropTableIfExists(tgtCasLib, tgtCasTable);

  table.loadtable result=r status=rc / caslib=tgtCasLib path=tgtCasPath casout={name=tgtCasTable caslib=tgtCasLib} promote=1;
  if rc.statusCode != 0 then do;
    return rc.statusCode;
  end;
end;

else do;
  dropTableIfExists(tgtCasLib, tgtCasTable);
  dropTableIfExists(tgtCasLib, tgtCasTable);
  table.promote result=r status=rc / caslib=srcCasLib name=srcCasTable target=tgtCasTable targetLib=tgtCasLib;
  if rc.statusCode != 0 then do;
    return rc.statusCode;
  end;
end;


dropTableIfExists("CASUSER(bintang.muhammad@student.umn.ac.id)", "9c84c627-a6cf-4a26-8806-94eb69a4b7af");

function doesTableExist(casLib, casTable);
  table.tableExists result=r status=rc / caslib=casLib table=casTable;
  tableExists = dictionary(r, "exists");
  return tableExists;
end func;

function dropTableIfExists(casLib,casTable);
  tableExists = doesTableExist(casLib, casTable);
  if tableExists != 0 then do;
    print "Dropping table: "||casLib||"."||casTable;
    table.dropTable result=r status=rc/ caslib=casLib table=casTable quiet=0;
    if rc.statusCode != 0 then do;
      exit();
    end;
  end;
end func;

/* Return list of columns in a table */
function columnList(casLib, casTable);
  table.columnInfo result=collist / table={caslib=casLib,name=casTable};
  ndimen=dim(collist['columninfo']);
  featurelist={};
  do i =  1 to ndimen;
    featurelist[i]=upcase(collist['columninfo'][i][1]);
  end;
  return featurelist;
end func;
