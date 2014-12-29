create table AnneeFormations
(
   id                   autoincrement,
   titre                varchar(254),
   dateDebut            datetime,
   dateFin              datetime,
   primary key (id)
);

create table Groupes
(
   id                   autoincrement,
   nom                  varchar(254),
   code                 varchar(254),
   description          memo,
   Filiere_id           int not null,
   AnneeFormation_id    int not null,

   primary key (id),

 foreign key (Filiere_id)
      references Filieres(id),
 foreign key (AnneeFormation_id)
      references AnneeFormations(id)

);
create table Formations
(
   id                   autoincrement,
   Formateur_Id         int not null,
   Module_id            int not null,
   AnneeFormation_id    int not null,
   Groupe_id            int not null,
   primary key (id),


 foreign key (Formateur_Id)
      references Formateurs(id),

 foreign key (Module_id)
      references Modules(id),

 foreign key (AnneeFormation_id)
      references AnneeFormations(id),

 foreign key (Groupe_id)
      references Groupes(id)

);

create table ControleContinues
(
   id                   autoincrement primary key,
   Formation_id         int not null,
   code                 varchar(254),
   titre                varchar(254),
   commentaire          memo,
   date datetime,

 foreign key (Formation_id)
      references Formations(id)
);

create table NoteContenuePrecisions
(
   id                   autoincrement primary key,
   valeur               float,
   ContenuePrecision_id int not null,
   Stagiaire_id         int not null,

foreign key (ContenuePrecision_id) references ContenuePrecisions(id),
foreign key (Stagiaire_id) references Stagiaires(id)

);
create table NoteControleContinue
(
   id                   autoincrement primary key,
   Stagiaire_id         int not null,
   valeur               float,

foreign key (Stagiaire_id) references Stagiaires(id)
);