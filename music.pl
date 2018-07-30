:-dynamic(song/6).

song(thats_why_you_go_away,michael,played_on_paper,1995,pop,english).
song(when_you_tell_me_that_you_love_me,westlife,face_to_face,2005,pop,english).
song(crush,usher,chapters,2016,pop,english).
song(apologize,timbaland,shock_value,2007,rap,english).
song(if_i_let_you_go,westlife,weslife,1999,pop,english).
song(november_rain,guns_n_roses,use_your_illusion1,1991,hard_rock,english).
song(paradise_city,guns_n_roses,appetite_for_destruction,1987,hard_rock,english).
song(you_could_be_mine,guns_n_roses,use_your_illusion2,1991,rock,english).
song(dance_of_death,iron_maiden,studio_album,2003,heavy_metal,english).
song(everything_i_do,bryan_adams,waking_up_the_neighbours,1991,rock,english).
song(heaven,bryan_adams,reckless,1984,rock,english).
song(summer_of_69,bryan_adams,reckless,1984,rock,english).
song(run_to_u,bryan_adams,reckless,1984,rock,english).
song(somebody,bryan_adams,reckless,1984,rock,english).

song(tomake,artcell,oniket_prantor,2006,rock,bangla).
song(dhushor_shomoy,artcell,oniket_prantor,2006,rock,bangla).
song(poth_chola,artcell,onno_shomoy,2002,rock,bangla).
song(joto_dure,warfaze,pathchala,2009,rock,bangla).
song(rupkotha,warfaze,shotto,2012,rock,bangla).


song(gota_fria,carlos_vives,clásicos_de_la_provincia,1993,pop,spanish).
song(ni_rosas,paulina_rubio,gran_cit,2009,pop,spanish).
song(besame_mucho,andrea_bocelli,amore,2006,soft_rock,spanish).
song(el_porompompero,manolo_escobar,mr_porompompero,1979,folk,spanish).


song(gamalo,amr_diab,shoft_el_ayam,2014,unknown,arabian).
song(aah_w_noss,nancy_ajram,unknown,2004,unknown,arabian).




menu:-
      write('Enter menu(1) to select the genre of music'),nl,
      write('Enter menu(2) to see music list of a year'),nl,
      write('Enter menu(3) to find a song'),nl,
      write('Enter menu(4) to show the album name of a song'),nl,
      write('Enter menu(5) to see the playlist'),nl,
      write('Enter menu(6) to select the language of music'),nl,
      write('Enter menu(7) to select song of a artist'),nl,
      write('Enter menu(8) to add a new song in the playlist'),nl,
      write('Enter menu(9) for delete'),nl,
      write('Enter menu(10) for song recomandation .'),nl,nl,
      
      read(X),
      menu(X).


menu(1):-
   	 write('Enter 1 for pop music'),nl,
   	 write('Enter 2 for rock music'),nl,
   	 write('Enter 3 for rap music'),nl,
   	 write('Enter 4 for hard_rock music'),nl,
   	 write('Enter 5 for folk music'),nl,
   	 read(Y),
    	 sel(Y).
           sel(1):-
           song(X,_,_,_,pop,_),
           write(X),nl,fail,
           write("which song"),nl,
	   read(C),
	   format('~w song is playing',[C]).
           

	   sel(2):-
           song(X,_,_,_,rock,_),
           write(X),nl,fail,
           write("which song"),nl,
	   read(C),
	   format('~w song is playing',[C]).

	   sel(3):-
           song(X,_,_,_,rap,_),
           write(X),nl,fail,
           write("which song"),nl,
	   read(C),
	   format('~w song is playing',[C]).

	   sel(4):-
           song(X,_,_,_,hard_rock,_),
           write(X),nl,fail,
           write("which song"),nl,
	   read(C),
	   format('~w song is playing',[C]).

	   sel(5):-
           song(X,_,_,_,folk,_),
           write(X),nl,fail,
           write("which song"),nl,
	   read(C),
	   format('~w song is playing',[C]).

menu(2):-
     write('Enter a year'),nl,
     read(YA),
     song(X,_,_,YA,_,_),
     write(X),nl,fail,
     write("which song"),nl,
     read(C),
     format('~w song is playing',[C]).

menu(3):-
   write('write the song name'),nl,
   read(S),
   song(S,_,_,_,_,_),
   write('enter yes for play and no for not play'),nl,
   read(D),
   play(S,D).
	
 play(S,yes):-
		
                write('Music is playing').
                format('~w is playing',[S]).
 play(S,no):-
               menu.
          

menu(4):-
    write('Enter the song name :'),nl,
    read(S),nl,

    song(S,_,B,_,_,_),
	write(B),nl,
    format(' Album name is ~w',[A]).

menu(5):-
     song(X,_,_,_,_,_),
     write(X),nl,fail,
        write("which song"),nl,
	read(C),
	format('~w song is playing',[C]).


menu(6):-
    write('Enter a lanuage to music of that'),nl,
    read(L),
    song(X,_,_,_,_,L),
    write(X),nl,fail,
    write('which music you wants to play ?'),nl,
    read(N),nl,
    format('~w song is playing',[N]).

menu(7):-
           write('Enter artist/band name :' ),nl,
           read(A_N),nl,
           song(X,A_N,_,_,_,_),
           write(X),nl,fail,
           write("which song"),nl,
	   read(C),
	   format('~w song is playing',[C]).


menu(8):-
     write('Enter Song name:'),nl,
     read(S),nl,
     write('Enter Artist name:'),nl,
     read(A),nl,
     write('Enter Album name:'),nl,
     read(X),nl,
     write('Enter Year:'),nl,
     read(Y),nl,
     write('Enter Genre:'),nl,
     read(G),nl,
     write('Enter Language:'),nl,
     read(L),nl,

     assertz(song(S,A,X,Y,G,L)),
     
     write('Successfully added in the laylist').
     
    
menu(9):- 
    write('Enter 1 to delete a song '),nl,
    write('Enter 2 to delete an album'),nl,
    read(D),
    del(D).

           del(1):-
                  write('Enter the song name :'),nl,
                  read(S_N),
                  retractall(song(S_N,_,_,_,_,_)),nl,
                  write('Deletion completed .'),nl.
             

           del(2):-
                  write('Enter the album name :'),nl,
                  read(S_N),
                  retractall(song(_,_,A_N,_,_,_)),nl,
                  write('Deletion completed .'),nl.


menu(10):-
	write('For yes enter y and for no enter n '),nl,
        write('Are in happy mood ?'),nl,
        read(C),nl,
	write(C),nl,
        write('Are in frustration mood ?'),nl,
        read(D),nl,
	write(D),nl,
        
       com(C,D).

       com(y,n):-
           song(X,_,_,_,soft_rock,_),
           write(X),nl,fail,
           write("which song"),nl,
	   read(C),
	   format('~w song is playing',[C]).

       com(n,y):-
	   song(X,_,_,_,heavy_metal,_),
           write(X),nl,fail,
           write("which song"),nl,
	   read(C),
	   format('~w song is playing',[C]).

       com(y,y):-
           write('Sorry ! No suggestion is possible').

       com(n,n):-
	   song(X,_,_,_,rock,_),
           write(X),nl,fail,
           write("which song"),nl,
	   read(C),
	   format('~w song is playing',[C]).