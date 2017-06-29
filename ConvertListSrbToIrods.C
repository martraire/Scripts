 {
  ifstream in;
  //in.open("shower_EPOS_FER_E19_th53-60.txt",ios::in);
  //in.open("proton_SIBYLL_3E19_th45.txt",ios::in);
  //in.open("fer_SIBYLL_3E19_th45.txt",ios::in);
  //in.open("proton_EPOS_3E19_th45.txt",ios::in);
  //in.open("fer_EPOS_3E19_th45.txt",ios::in);
  //in.open("shower_corsika_QSGJET2_E19_th36-45.txt",ios::in);
  //in.open("shower_fer_QSGJET2_E19_th53-60.txt",ios::in);
  in.open("QSGJET2_PRO/shower_corsika_QSGJET2_E19_th25-36.txt",ios::in);

  vector<string> vname, vpath;
  int it, code_prim; 
  int deb_it = 447, number_file = 100;
  long id;
  float theta, energy;
  string name, path, corsika, model, primary; 
  int size = vname.size();

  while(!in.eof()) {
    
    in >> it >> id >> name >> path >> corsika >> model >> primary >> code_prim >>  energy >> theta;
    //    cout << it << " " << id << " " << name << " " << path << " " <<corsika << " " << model << " " << primary << " " << code_prim << " " << energy << " " << theta << endl;
    //cout <<  deb_it << " " <<  number_file << " " << it << endl;
    //cout << it << " " << id << endl;
    if(in.eof()) break;
     
    if(it > (deb_it + number_file))
      break;
    
    if(it >= deb_it) 
      {
	vname.push_back(name);
	vpath.push_back(path);
      }
  }
  in.close();
  
     
  // For SRB to use with command : SdbGetShower file_name run_init nb_runs
  //  for(int i = 0; i < (number_file); i++) 
  //{ 
  //   cout << "'" << vname[i] << "' ";
  // }

  //For IRODS to use with command : iget path/name_corsika_file want to get !

  //for(int i = 0; i < (number_file); i++) 
    // POUR SCRIPT BATCH
    //cout << "'" << vpath[i] << "/" << vname[i] << ".part' ";
    // POUR SCRIPT PERL
    //cout << "'" << vpath[i] << "/" << vname[i] << ".part', ";
  // cout << " " << endl;

     
  for(int i = 0; i < (number_file); i++) 
    cout << "'" << vname[i] << "' ";

  
}
