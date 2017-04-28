%% This is file `spr-mp-sola.bst'
%%
%% Please submit bugs or your comments to vtexspr@vtex.lt
%%
%% Sorting entries is done by name and year fields!
%% The last changes added on 30\07\2007
%%
%% You are free to use this style file as you see fit, provided 
%% that you do not make changes to the file. 
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.0 or, at your option, any later version.

% TeX programming: Linas Stonys, VTeX, Lithuania, vtexspr@vtex.lt 

% last changes: 2007 09 04

ENTRY
  { address
    author
    booktitle
    chapter
    doi
    edition
    editor
    howpublished
    institution
    isbn
    journal
    key
    month
    note
    number
    organization
    pages   
    publisher
    school
    series
    title
    type
    volume
    year
    url
  }
  {}
   { label extra.label sort.label short.list }

INTEGERS { output.state before.all mid.sentence after.sentence
           after.block after.authors between.elements }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #4 'after.authors :=
  #5 'between.elements :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { " " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
         % "\newblock " write$
        }
        {
          output.state after.authors =
          { ": " * write$
            newline$
          %  "\newblock " write$
          }
          { output.state between.elements =
              { ", " * write$ }
              { output.state before.all =
                   'write$
                  { add.period$ " " * write$ }
                  	
                  	
                  if$
              }
              if$
          }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}
FUNCTION {fin.entry}
{
  "." *
write$ newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}


FUNCTION {insert.comma}
{ output.state before.all =
    'skip$
    { between.elements 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}


FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {sort.format.month}
{ 't :=
 	 t #1 #2 substring$ "01" =
 	 t	#1 #1 substring$ "1" =
 	 t	#2 #2 substring$ "" =
 	 and or
 	 { "January" }
    { t #1 #2 substring$ "02" =
			t	#1 #1 substring$ "2" =
			t	#2 #2 substring$ "" =
			and or
      { "February" }
      { t #1 #2 substring$ "03" =
 		    t #1 #1 substring$ "3" =
 		    t	#2 #2 substring$ "" =
 		    and or
        { "March" }
        { t #1 #2 substring$ "04" =
        	t #1 #1 substring$ "4" =
        	or
          { "April" }
          { t #1 #2 substring$ "05" =
           	t #1 #1 substring$ "5" =
           	or
            { "May" }
            { t #1 #2 substring$ "06" =
  	          t #1 #1 substring$ "6" =
  	          or
              { "June" }
              { t #1 #2 substring$ "07" =
              	t #1 #1 substring$ "7" =
              	or
                { "July" }
                { t #1 #2 substring$ "08" =
 		              t #1 #1 substring$ "8" =
 		              or
                  { "August" }
                  { t #1 #2 substring$ "09" =
                    t #1 #1 substring$ "9" =
                    or
                    { "September" }
                    { t #1 #2 substring$ "10" =
                      { "October" }
                      { t #1 #2 substring$ "11" =
                        { "November" }
                        { t #1 #2 substring$ "12" =
                          { "December" }
                          { t } % No match
                        if$
                        }
                      if$
                      }
                    if$
                    }
                  if$
                  }
                if$
                }
              if$
              }
            if$
            }
          if$
          }
        if$
        }
      if$
      }
    if$
    }
  if$
 
}

FUNCTION {bold}
{ duplicate$ empty$
    { pop$ "" }
    { "\textbf{" swap$ * "}" * }
  if$
}
FUNCTION {textit}
{ duplicate$ empty$
    { pop$ "" }
    { "\textit{" swap$ * "}" * }
  if$
}
%%%%%%%%%%%%%%%% springer publisher
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% formating bbl
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {batitle}
{ duplicate$ empty$
    { pop$ "" }
    { "\batitle{" swap$ * "}" * }
  if$
}
FUNCTION {byear}
{ duplicate$ empty$
    { pop$ "" }
    { "\byear{" swap$ * "}" * }
  if$
}
FUNCTION {bissue}
{ duplicate$ empty$
    { pop$ "" }
    { "\bissue{" swap$ * "}" * }
  if$
}
FUNCTION {bctitle}
{ duplicate$ empty$
    { pop$ "" }
    { "\bctitle{" swap$ * "}" * }
  if$
}

FUNCTION {binstitute}
{ duplicate$ empty$
    { pop$ "" }
    { "\binstitute{" swap$ * "}" * }
  if$
}
FUNCTION {bsnm}
{ duplicate$ empty$
    { pop$ "" }
    { "\bsnm{" swap$ * "}" * }
  if$
}
FUNCTION {bpublisher}
{ duplicate$ empty$
    { pop$ "" }
    { "\bpublisher{" swap$ * "}" * }
  if$
}
FUNCTION {bsertitle}
{ duplicate$ empty$
    { pop$ "" }
    { "\bsertitle{" swap$ * "}" * }
  if$
}
FUNCTION {bedition}
{ duplicate$ empty$
    { pop$ "" }
    { "\bedition{" swap$ * "}" * }
  if$
}
FUNCTION {bfpage}
{ duplicate$ empty$
    { pop$ "" }
    { "\bfpage{" swap$ * "}" * }
  if$
}
FUNCTION {blpage}
{ duplicate$ empty$
    { pop$ "" }
    { "\blpage{" swap$ * "}" * }
  if$
}
FUNCTION {bvolume}
{ duplicate$ empty$
    { pop$ "" }
    { "\bvolume{" swap$ * "}" * }
  if$
}
FUNCTION {betal}
{ duplicate$ empty$
    { pop$ "" }
    { "\betal{" swap$ * "}" * }
  if$
}
FUNCTION {binits}
{ duplicate$ empty$
    { pop$ "" }
    { "\binits{" swap$ * "}" * }
  if$
}
FUNCTION {bseriesno}
{ duplicate$ empty$
    { pop$ "" }
    { "\bseriesno{" swap$ * "}" * }
  if$
}
FUNCTION {beditor}
{ duplicate$ empty$
    { pop$ "" }
    { "\beditor{" swap$ * "}" * }
  if$
}
FUNCTION {bbtitle}
{ duplicate$ empty$
    { pop$ "" }
    { "\bbtitle{" swap$ * "}" * }
  if$
}

FUNCTION {burl}
{ duplicate$ empty$
    { pop$ "" }
    { "\textsf{\burl{" swap$ * "}}" * }
  if$
}
FUNCTION {begin.bbtitle}
{ duplicate$ empty$
    { pop$ "" }
    { "\bbtitle{" swap$ * }
  if$
}

FUNCTION {bparticle}
{ duplicate$ empty$
    { pop$ "" }
    { "\bparticle{" swap$ * "}" * }
  if$
}
FUNCTION {bsuffix}
{ duplicate$ empty$
    { pop$ "" }
    { "\bsuffix{" swap$ * "}" * }
  if$
}
FUNCTION {blocation}
{ duplicate$ empty$
    { pop$ "" }
    { "\blocation{" swap$ * "}" * }
  if$
}

FUNCTION {binterref}
{ duplicate$ empty$
    { pop$ "" }
    { "\binterref{" swap$ * "}" * }
  if$
}

FUNCTION {bjtitle}
{ duplicate$ empty$
    { pop$ "" }
    { "\bjtitle{" swap$ * "}" * }
  if$
}
%FUNCTION {bauthor}
%{ "\bauthor{" swap$ * "}" * }
%%%%%%%%%%%%%
FUNCTION {springer.publisher}
{publisher #1 #8 substring$ "Springer" =
	{ "Springer"  }
  { publisher }
if$
}

FUNCTION {format.pub.address}
{ publisher empty$
    { "" }
    { address empty$
        {publisher bpublisher}
        { springer.publisher bpublisher ", " * address blocation *}
      if$
    }
  if$
}
FUNCTION {not.format.pub.address}
{ publisher empty$
    { "" }
    { address empty$
        {publisher}
        { publisher ", " * address *}
      if$
    }
  if$
}
STRINGS { v l f j b}
INTEGERS { nameptr namesleft numnames}
FUNCTION {format.author.editor}
{ 'b :=
   	b "editor" =
   	b "beditor" =
   	or
			{editor 's :=}
			{author 's :=}
		if$
 
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    {	 s nameptr "{vv~}" format.name$ bparticle 'v := 
       s nameptr "{ll}" format.name$ bsnm 'l :=   
    	s nameptr "{f{.}.}" format.name$ binits  'f := 
     	s nameptr "{ jj}" format.name$ bsuffix 'j := 
   		l  "\bsnm{others}" =
   		{  "et~al." betal * }
   		{
   	b "editor" =
   		{j empty$
		 		  {"\beditor{" * v * l * ",~" * f * "}" * j  't :=}
		 	  	{"\beditor{" * v * l * ",~" * f * j * "}" 't :=}
		   if$
		  }
		  'skip$
		  if$
   	b "author" =
   		{j empty$
		 		{"\bauthor{" * v * l * ",~" * f * "}" * j  't :=}
		 		{"\bauthor{" * v * l * ",~" * f * j * "}" * "" 't :=}
		   if$
		  }
		  'skip$
		  if$
   	b "bauthor" =
   	b "beditor" =
   	or
   		{j empty$
		 		{"\oauthor{" * v * l * "~" * f * "}" * j  't :=}
		 		{"\oauthor{" * v * l * "~" * f * j * "}" * "" 't :=}
		 if$
		 } 
		  'skip$
		if$
		 } 
		if$
		 	namesleft #0 >
        { namesleft #1 >
            {", " * t * }
            {""}
          if$
        }
        't
      
      if$
      nameptr #1 + 'nameptr := 
      namesleft #1 - 'namesleft :=
    }
  while$
  
}

FUNCTION {format.springer.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{, f{.}.}{~jj}" format.name$ 't :=
    
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { numnames #1 >
                { ", " * }
                'skip$
              if$
              t "others" =
                { " et~al." * }
                { "" * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {notconstr.editors}
{ editor empty$
    { "" }
    { author empty$
    		{"beditor" format.author.editor}
    		{editor format.springer.names}
    	if$
      editor num.names$ #1 >
        { " (eds.)" * }
        { " (ed.)" * }
      if$
    }
  if$
}
FUNCTION {notconstr.authors}
{ author empty$
    { "" }
 {"bauthor" format.author.editor}
  if$
}


FUNCTION {format.editors}
{ editor empty$
    { "" }
    { "editor" format.author.editor
      editor num.names$ #1 >
        { " (eds.)" * }
        { " (ed.)" * }
      if$
    }
  if$
}
FUNCTION {format.authors}
{ author empty$
    { "" }
 { "author" format.author.editor}
  if$
}
FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}
FUNCTION {cite.a}
{ %author num.names$ duplicate$
  author num.names$ #3 >
    {  "{" write$ }
    {author num.names$ #3 =
        { author #3 "{vv~}{ll}{ jj}{ f}" format.name$ "others" =
            { "{" write$ }
     		    		'skip$
          if$
        }
		    {author num.names$ #2 =
    		        {author #2 "{vv~}{ll}{ jj}{ f}" format.name$ "others" =
            				{ "{" write$ }
       		    		'skip$
     		    			if$
     		    		}
     		    		'skip$
        	 if$
        }
      if$
    }
  if$
}


FUNCTION {cite.author}
{ author #1 "{vv~}{ll}" format.name$
  author num.names$ duplicate$
  #3 >
    { pop$ "} {\it et~al.}" * }
    { #3 =
        { author #3 "{vv~}{ll}{ jj}{ f}" format.name$ "others" =
            { "} {\it et~al.}"  * }
            { ", " * author #2 "{vv~}{ll}" format.name$ * 
             ", and " * author #3 "{vv~}{ll}" format.name$ *  
            }
          if$
        }
		    {author num.names$ #2 =
    		        {author #2 "{vv~}{ll}{ jj}{ f}" format.name$ "others" =
            				{ "} {\it et~al.}"  * }
     		    				{ " and " * author #2 "{vv~}{ll}" format.name$ * }
     		    			if$
     		    		}
     		    		'skip$
        	 if$
        }
      if$
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
author empty$ year empty$ and
{pop$ "empty author and year in " * cite$ * warning$ 
  "\bibitem[\protect\citeauthoryear{}{}]{" write$ 
  cite$ write$
  "}" write$
  newline$
  ""
}
{year empty$
	{
  	"\bibitem[\protect\citeauthoryear{" write$
  	cite.a 
   	cite.author write$ "}{}]{" write$ 
  	cite$ write$
  	"}" write$
  	newline$
  	""
  }
	{	author empty$
	  {
	  	"\bibitem[\protect\citeauthoryear{}{" write$ year write$ "}]{" write$ 
	  	cite$ write$
  		"}" write$
  		newline$
  		""
  	}	
	  {
	  	"\bibitem[\protect\citeauthoryear{" write$
	  	cite.a 
	   	cite.author write$ "}{" write$ year write$ "}]{" write$ 
	  	cite$ write$
  		"}" write$
  		newline$
  		""
  	}
  	if$	
  }
 if$ 	
}
if$
  before.all 'output.state :=
}


INTEGERS { multiresult char.num k }

 
FUNCTION {string.to.integer}
{ 't :=
    t text.length$ 'k :=
  #1 'char.num :=
      { t char.num #1 substring$ 's :=
	 	  s is.num
	 	  s "." =
	 	  or 
	 	  char.num k = not
	 	  and
	 	 	}
	 	 {char.num #1 + 'char.num :=}
  while$
  char.num #1 - 'char.num :=
  t #1 char.num substring$ 
  
%  "S" k * write$
}


FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}
FUNCTION {n.notilde}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "~" =
            {   { t #1 #1 substring$ "~" = }
                { "" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}
FUNCTION {note.presented}
 {note #1 #9 substring$ "presented" = 
 	note #1 #9 substring$ "Presented" = 
 or}
 
%  if$
%}

FUNCTION {n.nobeckflash}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "\" =
            {   { t #1 #1 substring$ "\" = }
                { "" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {n.pages}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #2 substring$ "--" =
              
                { "" *
                  t #2 global.max$ substring$ 't :=
                }
            
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {n.nosmallspace}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "," =
            {   { t #1 #1 substring$ "," = }
                { "" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}
FUNCTION {n.filter}
{ n.nobeckflash
	n.nosmallspace
	n.notilde
}
FUNCTION {n.c.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-"   = 
        { t #1 #2 substring$ "--" = not
  %          { "--"  *
            { "\,--\,"  *
              t #2 global.max$ substring$   't :=
            }
            {   { t #1 #1 substring$ "-" = } 
                {  "-" *
                  t #2 global.max$ substring$ 't :=
                 }
              while$
             }
          if$
        }
        { t #1 #1 substring$  *
          t #2 global.max$ substring$ 't :=
       }
      if$
    }
  while$
}FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-"   = 
        { t #1 #2 substring$ "--" = not
 %           { bfpage "--"  *
             { bfpage "\,--\,"  *
              t #2 global.max$ substring$  blpage 't :=
            }
            {   { t #1 #1 substring$ "-" = } 
                {  "-" *
                  t #2 global.max$ substring$ 't :=
                 }
              while$
             }
          if$
        }
        { t #1 #1 substring$  *
          t #2 global.max$ substring$ 't :=
       }
      if$
    }
  while$
}
FUNCTION {format.year}
{ year empty$
   'skip$
    { year byear "," * }
    if$
}
FUNCTION {format.date}
{ year empty$
   'skip$
    { year "," * }
    if$
}
FUNCTION {format.month}
{ month empty$
'skip$
{month sort.format.month}
if$
}
FUNCTION {formatpatent.date}
{ year empty$
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$}
         
      if$
    }
    { month empty$
       { year byear}
        {format.month " " * year byear *}
      if$
    }
  if$
}
FUNCTION {not.format.date}
{ year empty$
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$
          month
        }
      if$
    }
    { month empty$
        'year 
        { format.month " " * year * }
      if$
    }
  if$
}
FUNCTION {format.btitle}
{ title bbtitle
}
FUNCTION {bcommentas}
{ duplicate$ empty$
    { pop$ "" }
    { "" swap$ * "}" * }
  if$
}
FUNCTION {bcommenta}
{ duplicate$ empty$
    { pop$ "" }
    { "\bcomment{" swap$ * }
  if$
}
FUNCTION {bcomment}
{ duplicate$ empty$
    { pop$ "" }
    { "\bcomment{" swap$ * "}" * }
  if$
}

FUNCTION {not.format.chap}
{ chapter empty$
    {""}
    { type empty$
        { "\bcomment{Chap. " chapter * "}" *}
        { "\bcomment{" type "l" change.case$ * chapter * "}" *}
      if$
      
      
    }
  if$
}

FUNCTION {chap.not}
{  
  		note empty$
			{chapter bcomment output}
				{ 
				 "Chap. " chapter * bcommenta output 
					new.sentence
				 note bcommentas output
				}
		if$
}
FUNCTION {chap.note}
{		note empty$ chapter empty$ and
		'skip$
	{	chapter empty$
			{note bcomment output}
			{note empty$
				{chapter bcomment output}
						{		type empty$
									{ 
									 "Chap. " chapter * bcommenta output 
										new.sentence
									 note bcommentas output
									}
									{ type "Section" = 
									 		{	"Sect. " chapter * bcommenta output 
												new.sentence
									 			note bcommentas output
									 		}
											{ 
											 "Chap. " chapter * bcommenta output 
												new.sentence
											 note bcommentas output
											}
										if$	
									}
								if$}
					if$
				}
			if$
	}
	if$
		
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}
FUNCTION {no.space.connect}
{ duplicate$ text.length$ #3 <
    { "" }
    { "" }
  if$
  swap$ * *
}
FUNCTION {bcommen.chapter}
{ chapter empty$
    {""}
    { type empty$
        { "Chap." }
        { type "Section" =
        	{ "Sect." }
        	{ "Chap." }
        if$}
      if$
      chapter tie.or.space.connect
     
    }
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%% patent names
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}
FUNCTION {format.bvolume.proc}
{ volume empty$
    { "" }
    { series empty$
    	{volume  }
     	{ volume  bseriesno  }
		if$
    }
  if$
}

FUNCTION {not.format.bvolume}
{ volume empty$
    { "" }
    { pages empty$
    {   volume  }
     { volume  }
		if$
		} 
      "volume and number" number either.or.check
    
  if$
}
FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { series empty$
    	{ volume bseriesno }
     	{ volume bseriesno  }
		if$
      "volume and number" number either.or.check
    }
  if$
}
FUNCTION {format.series}
{ series empty$
	'skip$ 
	{ series bsertitle }
  if$
}
FUNCTION {not.format.series}
{ series empty$
	'skip$ 
	{ series  }
  if$
}
FUNCTION {not.format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { edition "l" change.case$ " edn" * }
        { edition "t" change.case$ " edn" * }
      if$
    }
  if$
}
FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { edition bedition "l" change.case$ " edn" * }
        { edition bedition "t" change.case$ " edn" * }
      if$
    }
  if$
}


FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult 
}
FUNCTION {format.isbn}
{ isbn empty$
    { "" }
    { new.block "\bisbn{" isbn * "}" *}
  if$
}
FUNCTION {not.format.isbn}
{ isbn empty$
    { "" }
    { new.block "ISBN "  isbn * }
  if$
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { pages n.pages n.dashify}% tie.or.space.connect }
        { pages }%tie.or.space.connect }

      if$
    }
  if$
}
FUNCTION {not.format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { pages n.pages n.c.dashify }%tie.or.space.connect }
        %{ pages n.pages n.c.dashify }%tie.or.space.connect }
        { pages }%tie.or.space.connect }

      if$
    }
  if$
}
FUNCTION {format.vol}
{ volume empty$
	'skip$
	{volume n.filter bvolume  }
  if$
	number empty$
    'skip$
    { "(" number bissue * ")" * *
      volume empty$
	{ "there's a number but no volume in " cite$ * warning$ }
	'skip$
      if$
    }
  if$
  
}

 FUNCTION {not.format.vol}
{ volume empty$
	'skip$
	{volume n.filter  }
  if$
	number empty$
    'skip$
    { "(" number * ")" * *
      volume empty$
	    { "there's a number but no volume in " cite$ * warning$ }
	    'skip$
      if$
    }
  if$
  
}

FUNCTION {bbl.pages}
{ "" }

FUNCTION {bbl.page}
{ "" }
FUNCTION {tag.url}
{ duplicate$ empty$
    { pop$ "" }
    { "\textsf{\url{" swap$ * "}}" * }
  if$
}

FUNCTION {format.url}
{ url empty$
    { "" }
    {url}
  if$
}

FUNCTION {not.format.url}
{ url empty$
    { "" }
    { url tag.url }
  if$
}
FUNCTION {format.doi}
{ doi empty$
		{""}
		 { "doi:" doi  * }
    
  if$
}
FUNCTION {not.format.ppages}
{ pages duplicate$ empty$ 'skip$
    { duplicate$ multi.page.check
        {
          bbl.pages swap$
          n.pages n.c.dashify
        }
        {
          bbl.page  swap$
        }
      if$
      *
    }
  if$
}

FUNCTION {format.ppages}
{ pages duplicate$ empty$ 'skip$
    { duplicate$ multi.page.check
        {
          bbl.pages swap$
          n.pages n.dashify
        }
        {
          bbl.page  swap$ bfpage
        }
      if$
      *
    }
  if$
}

FUNCTION {not.format.booktitle}
{ booktitle empty$
   { "" }
    { editor empty$
        { "In: " booktitle  * }
        { "In: " notconstr.editors * " " * booktitle  * }
      if$
    }
    
  if$
}
FUNCTION {format.in.ed.beginbooktitle}
{ booktitle empty$
   { "" }
    { editor empty$
        {series empty$
        	 {"In: " booktitle  begin.bbtitle  * }
        	 {"In: " booktitle begin.bbtitle  * }
        if$
        } 
        {series empty$
        	{ "In: " format.editors * " " * booktitle  begin.bbtitle  * }
        	{ "In: " format.editors * " " * booktitle begin.bbtitle  * }
        if$
        } 
      if$
    }
    
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
   { "" }
    { editor empty$
        { "In: " booktitle bbtitle   * }
        { "In: " format.editors * " " * booktitle bbtitle  * }
      if$
    }
    
  if$
}
FUNCTION {not.format.in.ed}
{ title empty$
   { "" }
    { editor empty$
        { title }
       { author empty$
        {  notconstr.editors * ": " * format.date  * " " title  * }
        { "In: " notconstr.editors * " " * title * }
      
        if$
   		 }
      if$
    }
    
  if$
}

FUNCTION {format.in.ed}
{ title empty$
   'skip$
    { editor empty$
        {  title bbtitle}
       { author empty$
        {  format.editors * ": " * format.year * " " title bbtitle * }
        { "In: " format.editors * " " * title bbtitle * }
      
        if$
   		 }
      if$
    }
    
  if$
}
FUNCTION {format.editor.date.bbtitle}
{ booktitle empty$
   { "" }
    { editor empty$
        { booktitle }
       { author empty$
        {  notconstr.editors * ": " * format.date * " " booktitle  * }
        { "In: " notconstr.editors * " " * booktitle  * }
      
        if$
   		 }
      if$
    }
    
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}
FUNCTION {format.in.ed.begintitle}
{ title empty$
   'skip$
    { editor empty$
        {  title bbtitle}
       { author empty$
        {  format.editors * ": " * format.year * " " title begin.bbtitle * }
        { "In: " format.editors * " " * title begin.bbtitle * }
      
        if$
   		 }
      if$
    }
    
  if$
}

FUNCTION {patent.number}
{    number empty$
		 'skip$
    { number }
  if$
}
INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}   
 
FUNCTION {format.inpres}
{ 't :=
   "In Press" #8
     "In press" #8
      "in press: " #10
        "in press. " #10
          "In press: " #10
            "In press. " #10
              "In press " #9
                  "in press " #9 t chop.word
               chop.word
             chop.word
           chop.word
         chop.word
       chop.word
      chop.word
     chop.word
  #1 global.max$ substring$
}
FUNCTION {inpress.check}
{volume empty$ pages empty$ number empty$ and and
   {insert.comma}
   'skip$
if$
 note format.inpres 
}
FUNCTION {bcomment.note}
{note empty$
'skip$
 {note format.inpres bcomment output}
 if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}
FUNCTION {stupid.colon}
{ after.authors 'output.state := }

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
        { "need key or journal for " cite$ * " to crossref " * crossref *
          warning$
          ""
        }
        { "In {\em " journal * "\/}" * }
      if$
    }
    { "In " key * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { "Volume" volume tie.or.space.connect
      " of " *
    }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { booktitle empty$
            { "need editor, key, or booktitle for " cite$ * " to crossref " *
              crossref * warning$
              ""
            }
            { "" }
          if$
        }
        { "" }
      if$
    }
    { "" }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {chapter.note}
{chapter empty$
	{note empty$
	'skip$
	{new.sentence note }
	if$
  }
  {note empty$
	{new.sentence chapter}
	{chapter new.sentence note}
	if$
  }
  if$

}
  
FUNCTION {and.the.note}
{note empty$
'skip$
 {inpress.check output}
 if$
}
FUNCTION {check.manual}
{	author empty$
	organization empty$ 
	title empty$ 
  year empty$ 
 	address  empty$ 
  
   or or or or
{ 
 "\begin{botherref}" write$ newline$
  author empty$
    { organization empty$
        'skip$
        { organization output.nonnull
          add.period$
        }
      if$
    }
    { notconstr.authors output.nonnull 
    stupid.colon}
  if$
    format.date output

  title empty$
  'skip$
  {format.title "title" output.check
 	add.period$}
   if$
  author empty$
    { organization empty$
        { %address new.block.checka
          address  output
        }
        'skip$
      if$
    }
    { %organization address new.block.checkb
      organization output
      address empty$
         'skip$
         { insert.comma }
      if$
      address output
      edition empty$
         'skip$
         { add.period$ }
      if$
    }
  if$
  new.sentence
  not.format.edition output
  new.sentence
  not.format.isbn output
  new.sentence
  not.format.url output
  new.sentence
  and.the.note
  fin.entry
 "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}
{"\begin{bbook}" write$ newline$
  author empty$
    { organization empty$
        'skip$
        { organization bpublisher output.nonnull
          add.period$
        }
      if$
    }
    { format.authors output.nonnull
    stupid.colon}
  if$
    format.date output

  title empty$
  'skip$
  {format.btitle "title" output.check
 	add.period$}
   if$
  author empty$
    { organization empty$
        { %address new.block.checka
          address blocation output
        }
        'skip$
      if$
    }
    { %organization address new.block.checkb
      organization bpublisher output
      address empty$
         'skip$
         { insert.comma }
      if$
      address blocation output
      edition empty$
         'skip$
         { insert.comma }
      if$
    }
  if$
 % new.sentence
  format.edition output
  new.sentence
  format.isbn output
  new.sentence
  format.url output
  new.sentence
  bcomment.note
  fin.entry
 "\end{bbook}" write$ newline$
  "\endbibitem" write$ newline$
}
if$
}


FUNCTION {check.bb.inbook}
{	author empty$
	institution empty$ 
	organization empty$ 
	editor empty$
	and and and
	title empty$ 
  year empty$ 
 	publisher empty$ address  empty$ 
  
   or or or or

{  "\begin{botherref}" write$ newline$
 author empty$
   'skip$ 
  {notconstr.authors output.nonnull 
  stupid.colon}
  if$    
  crossref missing$
    { not.format.in.ed output
      year empty$
      'skip$
			{format.date output}
    if$
    	series empty$
         {
         not.format.bvolume output
         volume empty$
         'skip$
         		{edition empty$
         			'skip$
         			{insert.comma}
         		if$}
         if$ 
			      not.format.edition output
      			   edition empty$
         			'skip$
         			{new.sentence}
         		if$
         }
         {
         	not.format.edition output
      			   edition empty$
         			'skip$
         			{new.sentence}
         	if$
         not.format.series output
         insert.comma 
         not.format.bvolume output
   	     new.sentence
        }
      if$ 
      not.format.pub.address output
      publisher empty$
   		   'skip$
    			{insert.comma}
    	if$
      not.format.pages output
   }
    { 
      new.block
      format.incoll.inproc.crossref output.nonnull
    }
  if$
 	new.sentence
  bcommen.chapter output
 	new.sentence
  not.format.isbn output
 	new.sentence
  format.doi output
 	new.sentence
  not.format.url output
 	new.sentence
  and.the.note
  fin.entry

  "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}
{  
"\begin{bbook}" write$ newline$
 author empty$
  'skip$
  {format.authors output.nonnull%"author" output.check
  stupid.colon
  format.year output}
  if$    
  crossref missing$
 { volume empty$ not series empty$ edition empty$ and and
  {format.in.ed.begintitle "title" output.check}
  {format.in.ed "title" output.check}
  if$
    edition empty$ series empty$ not and
    	{new.sentence}
		  {insert.comma}
		if$
    	series empty$
         {
      volume empty$ not 
      	{not.format.bvolume  "}" * output}
      	{not.format.bvolume  output}
      if$
         volume empty$
         'skip$
         		{edition empty$
         			'skip$
         			{insert.comma}
         		if$}
         if$ 
			      format.edition output
      			   edition empty$
         			'skip$
         			{new.sentence}
         		if$
         }
         {
         format.edition output
      			   edition empty$
         			'skip$
         			{new.sentence}
         		if$
         format.series output
         insert.comma 
         format.bvolume output
         insert.comma 
        }
      if$ 
  	     format.pub.address output
      publisher empty$
   		   'skip$
    			{insert.comma}
    	if$
    		 format.pages output
     }
    { 
      new.block
      format.incoll.inproc.crossref output.nonnull
    }
  if$
 	new.sentence
  format.isbn output
 	new.sentence
  format.doi binterref output
 	new.sentence
  format.url burl  output
 	new.sentence
 	chap.note
    fin.entry
	"\end{bbook}" write$ newline$
  "\endbibitem" write$ newline$
}
if$
}
FUNCTION {check.bc.inbook}
{	author empty$
	institution empty$ 
	organization empty$ 
	editor empty$
	and and and
	title empty$ 
  year empty$ 
 	publisher empty$ address  empty$ 
	or or or or
{  "\begin{botherref}" write$ newline$
 author empty$
  'skip$
  {notconstr.authors output.nonnull%"author" output.check
  			stupid.colon
  			format.date output
  		chapter empty$
  		'skip$
			{chapter output
      	add.period$}
			if$
  }
  if$    
  crossref missing$
    { not.format.in.ed "title" output.check
    edition empty$ series empty$ not and
    	{new.sentence}
		  {insert.comma}
		if$
    	series empty$
         {
         not.format.bvolume output
         insert.comma 
         not.format.edition output
	       new.sentence
         }
         {
         not.format.edition output
         new.sentence
         not.format.series output
         insert.comma 
         not.format.bvolume output
         insert.comma 
        }
      if$ 
			not.format.ppages output
   	     new.sentence
      not.format.pub.address output
    }
    { 
      format.incoll.inproc.crossref output.nonnull
    }
  if$
 	new.sentence
  not.format.isbn output
 	new.sentence
  format.doi output
 	new.sentence
  not.format.url output
 %	new.sentence
  %bcomen.chapter output
 	new.sentence
 			author empty$
				{chapter.note output}
			'skip$
		if$
%  bcomment.note
  fin.entry
  "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}
{"\begin{bchapter}" write$ newline$
 author empty$
  'skip$
  {format.authors output.nonnull
  	stupid.colon
  		format.year output
  		chapter empty$
  		'skip$
				{chapter bctitle output
      	add.period$}
			if$
  }
  if$    
  crossref missing$
    { format.in.ed "title" output.check
    edition empty$ series empty$ not and
    	{new.sentence}
		  {insert.comma}
		if$
    	series empty$
         {
         format.bvolume output
         insert.comma 
         format.edition output
         }
         {
         format.edition output
         new.sentence
         format.series output
         insert.comma 
         format.bvolume output
         insert.comma 
        }
      if$ 
      format.ppages output
      new.sentence
      format.pub.address output
    }
    { chapter bctitle output
      new.block
      format.incoll.inproc.crossref output.nonnull
    }
  if$
  format.isbn output
  new.sentence
  format.doi binterref output
  new.sentence
  format.url output
	new.sentence
	chap.not%	bcomment.note
	fin.entry
	"\end{bchapter}" write$ newline$
  "\endbibitem" write$ newline$
}
if$
}

FUNCTION {check.bc.inproc}
{	author empty$
	institution empty$ 
	and
	title empty$ 
  year empty$ 
 	publisher empty$ address  empty$ 
  
   or or or or
{ "\begin{botherref}" write$ newline$
  notconstr.authors output.nonnull
  author empty$
  'skip$
  {stupid.colon}
  if$
  format.date output
  format.title "title" output.check
 	 title empty$ booktitle empty$ not and
		  'skip$
			 {add.period$}
	 if$
  crossref missing$
    { not.format.booktitle "booktitle" output.check
			booktitle empty$ volume empty$ or
			 {add.period$}
			 {insert.comma}
			if$
      series empty$
         'skip$
        {not.format.series output
         insert.comma }
      if$  
      not.format.bvolume output
          address empty$
        { organization output
          new.sentence
          not.format.pub.address output
					new.sentence
        }
        { 
          organization output
          new.sentence
        }
      if$
    }
    { format.incoll.inproc.crossref output.nonnull
    }
  if$
        publisher empty$
   		   'skip$
    			{insert.comma}
    	if$
   not.format.pub.address output
         pages empty$
   		   'skip$
    			{insert.comma}
    	if$
  not.format.pages output
	new.sentence
  not.format.isbn output
  new.sentence
  format.doi output
  new.block
  not.format.url output
  new.sentence
	and.the.note
	fin.entry
  "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}
{	"\begin{bchapter}" write$ newline$
  format.authors output.nonnull
  author empty$
  'skip$
  {stupid.colon}
  if$
   format.year output
  format.title bctitle "title" output.check
 	 title empty$ booktitle empty$ not and
		  'skip$
			 {add.period$}
	 if$
  crossref missing$
    {volume empty$ not series empty$ and
    		{format.in.ed.beginbooktitle "booktitle" output.check}
    		{format.in.ed.booktitle "booktitle" output.check}
     	if$
			volume empty$ 
			 {add.period$}
			 {insert.comma}
			if$
      series empty$
         'skip$
        {format.series output
         insert.comma }
      if$  
      series empty$ volume empty$ not and
      	{format.bvolume.proc "}" * output}
      	{format.bvolume.proc output}
      if$
          address empty$
        { %organization publisher new.sentence.checkb
          organization empty$
             'skip$
             { insert.comma }
          if$
        	author empty$ editor empty$ and
          	{organization binstitute  output}
          	{organization output}
          if$
      publisher empty$
   		   'skip$
    			{insert.comma}
    	if$
          format.pub.address output
          pages empty$
             'skip$
             { insert.comma }
          if$        
        }
        {volume empty$ not organization empty$ not and
    		 		{new.sentence}
	   			   'skip$
  	  	 if$  
         
         author empty$ editor empty$ and
          	{organization binstitute  output}
          	{ organization output}
          if$
      		organization empty$ not publisher empty$ not and
    				{insert.comma}
   		   		'skip$
    			if$
          format.pub.address output
          new.sentence
        }
      if$
    }
    { format.incoll.inproc.crossref output.nonnull
    }
  if$
      pages empty$
   		   'skip$
    			{insert.comma}
    	if$  
  format.pages output
  new.sentence
  format.isbn output
  new.sentence
  format.doi binterref output
  new.sentence
  format.url  burl output
  new.sentence
	bcomment.note
	fin.entry
 "\end{bchapter}" write$ newline$
  "\endbibitem" write$ newline$
	}
if$
}
FUNCTION {check.proceedings}
{	author empty$
	institution empty$ 
	organization empty$ 
	editor empty$
	and and and
	title empty$ 
  year empty$ 
 	publisher empty$ address  empty$ 
  
   or or or or
{ "\begin{botherref}" write$ newline$
   author empty$
    { editor empty$ organization empty$ not and
 			   {organization output stupid.colon}
   			 { notconstr.editors output.nonnull
    			stupid.colon}
  		if$ 
  	}
    { notconstr.authors output.nonnull
   		 stupid.colon
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  year empty$
  'skip$
  {format.date output}
  if$
  format.title "title" output.check
			series empty$
         'skip$
        { insert.comma 
        	not.format.series output
         	insert.comma 
        }
      if$ 
  not.format.bvolume output
  editor empty$ 
    {  author empty$ not
          {
          new.sentence
          organization  output
         	insert.comma 
          not.format.pub.address output
          }
          {
         	insert.comma 
          not.format.pub.address output
          }
       if$
    }
    { publisher empty$
        {
          new.sentence
          organization  output
          new.sentence
          address output 
        }
        {
          organization  "organization"  output.check
      publisher empty$
   		   'skip$
    			{insert.comma}
    	if$
          not.format.pub.address output
         }
      if$
     }
  if$
      pages empty$
   		   'skip$
    			{insert.comma}
    	if$
  not.format.pages output
  new.sentence
  not.format.isbn output
  new.sentence
  format.doi output
  new.sentence
  not.format.url output
  new.sentence
  and.the.note
  fin.entry
 "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}
{"\begin{bbook}" write$ newline$
   author empty$
    { editor empty$
    {organization binstitute "organization" output.check stupid.colon}
    { format.editors output.nonnull 
    	stupid.colon}
  	if$ 
  	}
    { format.authors output.nonnull
    stupid.colon
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.year output
  format.btitle "title" output.check
  
				series empty$
         'skip$
        { formatpatent.date  output 
          new.sentence
        	format.series output
         	insert.comma 
        }
      if$ 
				series empty$ volume empty$ not title empty$ not and and
         	{insert.comma }
          'skip$
        if$
		format.bvolume output
          new.sentence
  editor empty$ author empty$ and
    { publisher empty$ 
        'skip$
        {
          insert.comma
          format.pub.address output
        }
      if$
    }
    { publisher empty$
        {
          new.sentence
          organization output
          format.pub.address output 
       }
        {
          organization "organization"  output.check
          insert.comma
          format.pub.address output
        }
      if$
     }
  if$
      pages empty$
   		   'skip$
    			{insert.comma}
    	if$
  format.pages output
  new.sentence
  format.doi binterref output
  new.sentence
  format.url burl output
  new.sentence
  bcomment.note 
  fin.entry
 "\end{bbook}" write$ newline$
  "\endbibitem" write$ newline$
}
if$
}	
   
   
   
   
FUNCTION {check.book}
{	author empty$
	institution empty$ 
	organization empty$ 
	editor empty$
	and and and
	booktitle empty$ 
  year empty$ 
 	publisher empty$ address  empty$ 
  
   or or or or
   {	
     "\begin{botherref}" write$ newline$
	  author empty$
    { notconstr.editors "author and editor" output.check
    editor empty$
    'skip$
    {stupid.colon}
    if$
    }
    { notconstr.authors output.nonnull
    stupid.colon
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.date output
  format.title "title" output.check
 % add.period$
 % new.sentence
  crossref missing$
    {edition empty$ series empty$ not and
    	{new.sentence}
		  {insert.comma}
		if$
    	series empty$
         {
         not.format.bvolume output
         insert.comma 
         not.format.edition output
         }
         {
         not.format.edition output
         new.sentence
         not.format.series output
         insert.comma 
         not.format.bvolume output
        }
      if$ 
     not.format.ppages output
      new.sentence
      not.format.pub.address output
    }
    { format.book.crossref output.nonnull
    }
  if$
  not.format.isbn output
      new.sentence
  format.doi output
      new.sentence
  not.format.url output
      new.sentence
  and.the.note
  fin.entry
  "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}
   {"\begin{bbook}" write$ newline$
	  author empty$
    { format.editors "author and editor" output.check stupid.colon}
    { format.authors output.nonnull
    stupid.colon
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.year output
  format.title bbtitle "title" output.check
  crossref missing$
    {edition empty$ series empty$ not and
    	{new.sentence}
		  {insert.comma}
		if$
    	series empty$
         {
         format.bvolume output
         insert.comma 
         format.edition output
         }
         {
         format.edition output
         new.sentence
         format.series output
         insert.comma 
         format.bvolume output
        }
      if$ 
      format.ppages output
      new.block
      new.sentence
      format.pub.address output
    }
    { format.book.crossref output.nonnull
    }
  if$
  format.isbn output
      new.sentence
  format.doi binterref output
      new.sentence
  format.url output
      new.sentence
  bcomment.note
  fin.entry
  "\end{bbook}" write$ newline$
  "\endbibitem" write$ newline$
}
   if$
}
FUNCTION {check.bookchapter}
{	author empty$
	institution empty$ 
	and
	booktitle empty$ 
  year empty$ 
 	publisher empty$ address  empty$ 
  
   or or or or
   {
     "\begin{botherref}" write$ newline$
  author empty$ editor empty$ not and
     'skip$
  {	notconstr.authors "author" output.check
  stupid.colon
 		format.date output
  	format.title "title" output.check
  	title empty$
  	'skip$
   	{new.sentence}
  	if$
	}
	if$ 
  crossref missing$
    { author empty$ editor empty$ not and
    		{format.editor.date.bbtitle output}
				{not.format.booktitle "booktitle" output.check}
   		if$
   		new.sentence
 	  	series empty$
         'skip$
        {not.format.series output
         insert.comma }
      if$ 
		  not.format.bvolume output
    edition empty$
    	'skip$
   		{ insert.comma }
    if$       
      not.format.edition output  
      }
    { format.incoll.inproc.crossref output.nonnull
    }
  if$
      publisher empty$
   		   'skip$
    			{insert.comma}
    	if$
      not.format.pub.address output
 	    insert.comma
 	    volume empty$ pages empty$ and
    	{insert.comma "in press" output}
			'skip$
			if$
      new.sentence
  author empty$ editor empty$ not and
  	{title output}
  	'skip$
  if$	
      pages empty$
    { new.sentence }
    { insert.comma }
      if$       
	not.format.pages output
      new.sentence
  not.format.isbn output
      new.sentence
  format.doi output
      new.sentence
  not.format.url output
      new.sentence
		  not.format.chap output
  new.sentence
  and.the.note
  fin.entry
  "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
   }
   {
     "\begin{bchapter}" write$ newline$
	format.authors output.nonnull
	stupid.colon
	format.year output
  format.title bctitle "title" output.check
  	title empty$
  	'skip$
   	{new.sentence}
  	if$
  crossref missing$
    {volume empty$ 
    		{format.in.ed.booktitle "booktitle" output.check}
    		{format.in.ed.beginbooktitle "booktitle" output.check}
     	if$
     	series empty$
         'skip$
        {add.period$ format.series output
         insert.comma }
      if$ 
      series empty$ volume empty$ not and
      	{format.bvolume "}" * output}
      	{format.bvolume output}
      if$
    edition empty$
    	'skip$
   		{ insert.comma }
    if$       
      format.edition output  
      }
    { format.incoll.inproc.crossref output.nonnull
    }
  if$
      publisher empty$
   		   'skip$
    			{insert.comma}
    	if$
      format.pub.address output
   volume empty$ pages empty$ and
    	{insert.comma "in press" output}
			'skip$
   if$
	 pages empty$
		    { new.sentence }
   		 	{ insert.comma }
   if$       
		 	format.pages output
		 	new.sentence
  format.isbn output
  new.sentence
  format.doi binterref output
  new.sentence
  format.url burl output
  new.sentence
  chapter empty$
			{chap.note}
		  {not.format.chap output}
  if$
	fin.entry
  "\end{bchapter}" write$ newline$
  "\endbibitem" write$ newline$
   }
   if$
 }

FUNCTION {check.article}
{	author empty$
	institution empty$ 
	editor empty$
	and and
	journal empty$ 
  year empty$ 
 	or or 
  volume empty$ pages  empty$ 
  doi empty$ and
   or or
  { 
  "\begin{botherref}" write$ newline$
    author empty$
    {editor empty$
    	{ institution empty$
    		{ journal  "journal" output.check}
    		{institution output}
    	if$	}
     	{ notconstr.editors "author and editor" output.check }
    	if$
    	}
    {  notconstr.authors output.nonnull
    	stupid.colon
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
	format.date  output
	format.title  "title" output.check
	title empty$
			'skip$
      {new.sentence}
	if$
  crossref missing$
    {journal  "journal" output.check
    volume empty$ 
       'skip$
			{not.format.vol output }
			if$
    }
    { format.article.crossref output.nonnull
    }
  if$
   	    pages empty$
      'skip$
      {insert.comma}
      if$
      not.format.pages output
	  new.sentence 
  format.isbn output
      new.sentence
  format.doi output
      new.sentence
  not.format.url output
      new.sentence
  and.the.note 
  fin.entry
    "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
   }
  { 
  "\begin{barticle}" write$ newline$
    author empty$
    {editor empty$
    	{institution binstitute output}
     	{format.editors "author and editor" output.check }
    	if$
    	}
    { format.authors output.nonnull
    	stupid.colon
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
	format.year output
	format.title batitle "title" output.check
	title empty$
			'skip$
      {new.sentence}
	if$
  crossref missing$
    {journal bjtitle   "journal" output.check
    volume empty$
    'skip$
		{format.vol output }
		if$
    }
    { format.article.crossref output.nonnull
    }
  if$
   	    pages empty$
      'skip$
      {insert.comma}
      if$
      format.ppages output
  format.isbn output
  new.sentence
  format.doi binterref output
  new.sentence
  format.url burl  output
  new.sentence
  bcomment.note
  fin.entry
    "\end{barticle}" write$ newline$
  "\endbibitem" write$ newline$
 	}
  if$
}

FUNCTION {article}
{ output.bibitem
  
	check.article
}
FUNCTION {patent}
{ output.bibitem
    "\begin{botherref}" write$ newline$
  notconstr.authors "author" output.check
  stupid.colon
 % 	format.date output
    format.title "title" output.check
    add.period$
		patent.number output
		insert.comma
  	not.format.date output
 	  new.sentence
 	  not.format.url output
  fin.entry
    "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}

FUNCTION { other } { patent }

FUNCTION {book}
{ output.bibitem
check.book
}

FUNCTION {booklet}
{ output.bibitem
    "\begin{botherref}" write$ newline$
  notconstr.authors output
  author empty$
  'skip$
  {stupid.colon}
  if$
  format.date  output
  format.title "title" output.check
  %howpublished address new.block.checkb
  howpublished output
  address empty$
     'skip$
     { insert.comma }
  if$
	address output
 	  new.sentence
	not.format.isbn output
 	  new.sentence
  format.doi output
 	  new.sentence
  not.format.url output
 	  new.sentence
  and.the.note
  fin.entry
 "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}

FUNCTION {inbook}
{ output.bibitem
	chapter empty$
			{check.bb.inbook}
  		{	chapter string.to.integer empty$ author empty$ not and
				{check.bc.inbook}
				{check.bb.inbook}
  			if$}
  if$
}
FUNCTION {incollection}
{ output.bibitem
  check.bookchapter
}

FUNCTION {inproceedings}
{ output.bibitem
	check.bc.inproc
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
check.manual
 }

FUNCTION {mastersthesis}
{ output.bibitem
    "\begin{botherref}" write$ newline$
  notconstr.authors "author" output.check
  stupid.colon
  format.date  output
  format.title "title" output.check
  new.block
  "Master's thesis" format.thesis.type output.nonnull
  school empty$
     'skip$
     { insert.comma }
  if$
  school "school" output.check
  address empty$
     'skip$
     { insert.comma }
  if$
  address output
	new.sentence
  not.format.isbn output
	new.sentence
  not.format.url output
	new.sentence
  and.the.note
  fin.entry
    "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}

FUNCTION {misc}
{ output.bibitem
    "\begin{botherref}" write$ newline$
   author empty$
     'skip$
  {notconstr.authors "author" output.check
  stupid.colon}
    if$
  format.date output
%	not.format.date output				
  format.title "title" output.check
  new.sentence
  howpublished output
  new.sentence
  not.format.isbn output
	new.sentence
  format.doi output
  new.sentence
  not.format.url output
  new.sentence
  and.the.note
 fin.entry
 empty.misc.check
    "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}

FUNCTION {phdthesis}
{ output.bibitem
    "\begin{botherref}" write$ newline$
  notconstr.authors "author" output.check
  stupid.colon
  format.date output
  format.title "title" output.check
  new.block
  "PhD thesis" format.thesis.type output.nonnull
  school empty$
     'skip$
     { insert.comma }
  if$
  school "school" output.check
  address empty$
     'skip$
     { insert.comma }
  if$
  address output
  new.sentence
  not.format.isbn output
  new.sentence
  format.doi output
  new.sentence
  not.format.url output
  new.sentence
  and.the.note
  fin.entry
    "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}

FUNCTION {proceedings}
{ output.bibitem
check.proceedings
}

FUNCTION {techreport}
{ output.bibitem
    "\begin{botherref}" write$ newline$
  notconstr.authors "author" output.check
  stupid.colon
  year empty$
  'skip$
  {format.date output}
  if$
  format.title "title" output.check
   new.block
  format.tr.number output.nonnull
  institution empty$
     'skip$
     { insert.comma }
  if$
  institution "institution" output.check
  address empty$
     'skip$
     { insert.comma }
  if$
  address output
  new.sentence
  not.format.isbn output
  format.doi output
  new.block
  not.format.url output
  new.block
  and.the.note
  fin.entry
    "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}

FUNCTION {unpublished}
{ output.bibitem
    "\begin{botherref}" write$ newline$
  notconstr.authors output
  author empty$
  'skip$
  {stupid.colon}
  if$
   year empty$ not author empty$ not and
  {format.date output}
  'skip$
  if$
  format.title "title" output.check
  title empty$
  'skip$
  {new.sentence}
  if$
  note empty$
    'skip$
  {note.presented 
  { %new.sentence
		note output}
    'skip$
  if$}
  if$
   year empty$ not author empty$ and
  {insert.comma year output}
  'skip$
  if$
  not.format.isbn output
  new.sentence
  format.doi output
  new.sentence
  not.format.url output
    note empty$
    'skip$
  {note.presented 
    'skip$
  {note output}
  if$}
  if$
  fin.entry
    "\end{botherref}" write$ newline$
  "\endbibitem" write$ newline$
}

FUNCTION {default.type} { unpublished }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}


READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

FUNCTION {format.lab.names}
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
        'skip$
        { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { " et~al." * }
            { " and " * s #2 "{vv~}{ll}" format.name$ * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.organization.label
        { type$ "manual" =
            'author.key.organization.label
            'author.key.label
          if$
        }
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list
  "("
  *
  year duplicate$ empty$
  short.list key field.or.null = or
     { pop$ "" }
     'skip$
  if$
  *
  'label :=
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { "   " * }
        'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
        { "et al" * }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          "zzz"
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              "z"
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$
              "z"
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$
              "z"
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ calc.label
  label sortify
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
 		{author empty$
   		'editor.organization.sort
      'author.organization.sort
     if$
    }
    { type$ "proceedings" =
      type$ "incollection" =
       or
    		{author empty$
        		'editor.organization.sort
            'author.organization.sort
        if$
        }
        { type$ "manual" =
            'author.organization.sort
            'author.sort
          if$
        }
      if$
    }
  if$
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.label :=
  sort.label *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

STRINGS { longest.label last.label next.extra }

INTEGERS { longest.label.width last.extra.num number.label }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'longest.label.width :=
  #0 'last.extra.num :=
  #0 'number.label :=
}

FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'next.extra :=
  extra.label
  duplicate$ empty$
    'skip$
    { "{\natexlab{" swap$ * "}}" * }
  if$
  'extra.label :=
  label extra.label * 'label :=
}

EXECUTE {initialize.longest.label}

ITERATE {forward.pass}

REVERSE {reverse.pass}

FUNCTION {bib.sort.order}
{ sort.label  'sort.key$ :=
}

ITERATE {bib.sort.order}

SORT

FUNCTION {write.preambule}
{   "\begin{thebibliography}{" number.label int.to.str$ * "}" * write$ newline$
	"\ifx \bisbn   \undefined \def \bisbn  #1{ISBN #1}   \fi" write$ newline$
	"\ifx \binits  \undefined \def \binits#1{#1} \fi" write$ newline$
	"\ifx \bauthor  \undefined \def \bauthor#1{#1} \fi" write$ newline$
	"\ifx \batitle  \undefined \def \batitle#1{#1} \fi" write$ newline$
	"\ifx \bjtitle  \undefined \def \bjtitle#1{\textit{#1}} \fi" write$ newline$
	"\ifx \bvolume  \undefined \def \bvolume#1{\textbf{#1}} \fi" write$ newline$
	"\ifx \byear  \undefined \def \byear#1{#1} \fi" write$ newline$
	"\ifx \bissue  \undefined \def \bissue#1{#1} \fi" write$ newline$
	"\ifx \bfpage  \undefined \def \bfpage#1{#1} \fi" write$ newline$
	"\ifx \blpage  \undefined \def \blpage #1{#1} \fi" write$ newline$
	"\ifx \burl  \undefined \def \burl#1{#1} \fi" write$ newline$
	"\ifx \binterref  \undefined \def \binterref#1{#1} \fi" write$ newline$
	"\ifx \betal  \undefined \def \betal#1{#1} \fi" write$ newline$
	"\ifx \binstitute  \undefined \def \binstitute#1{#1} \fi" write$ newline$
	"\ifx \bctitle  \undefined \def \bctitle#1{#1} \fi" write$ newline$
	"\ifx \beditor  \undefined \def \beditor#1{#1} \fi" write$ newline$
	"\ifx \bpublisher  \undefined \def \bpublisher#1{#1} \fi" write$ newline$
	"\ifx \bbtitle  \undefined \def \bbtitle#1{\textit{#1}} \fi" write$ newline$
	"\ifx \bedition  \undefined \def \bedition#1{#1} \fi" write$ newline$
	"\ifx \bseriesno  \undefined \def \bseriesno#1{\textbf{#1}} \fi" write$ newline$
	"\ifx \blocation  \undefined \def \blocation#1{#1} \fi" write$ newline$
	"\ifx \bsertitle  \undefined \def \bsertitle#1{\textit{#1}} \fi" write$ newline$
	"\ifx \bsnm \undefined \def \bsnm#1{#1} \fi" write$ newline$
	"\ifx \bsuffix \undefined \def \bsuffix#1{#1} \fi" write$ newline$
	"\ifx \bparticle \undefined \def \bparticle#1{#1} \fi" write$ newline$
	"\ifx \barticle \undefined \def \barticle#1{#1} \fi" write$ newline$
	
}


FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  write.preambule
  "\ifx \botherref \undefined \def \botherref #1{#1} \fi" write$ newline$
  "\ifx \url \undefined \def \url#1{\textsf{#1}} \fi" write$ newline$
	"\ifx \bchapter \undefined \def \bchapter#1{#1} \fi" write$ newline$
	"\ifx \bbook \undefined \def \bbook#1{#1} \fi" write$ newline$
	"\ifx \bcomment \undefined \def \bcomment#1{#1} \fi" write$ newline$
	"\ifx \oauthor \undefined \def \oauthor#1{#1} \fi" write$ newline$
	"\ifx \citeauthoryear \undefined \def \citeauthoryear#1{#1} \fi" write$ newline$
	"\def \endbibitem {}" write$ newline$
}
EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
 "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}




