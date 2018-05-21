unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var l:textfile;
    i,j,tip:integer;
    ok:boolean;
    cislo:array[1..100] of integer;
begin
assignfile(l,'loto.txt');  //vytvorenie súboru
rewrite(l);

randomize;
for i:=1 to 6 do      //tipuje 6 čísel
  begin
  cislo[i]:=0;
    repeat             //overenie, či sa čísla neopakujú
    tip:=random(49)+1;     //náhodne priradí čísla od 1 po 49
    ok:=false;
        for j:=1 to i-1 do            //overí či už rovnaké číslo bolo pred tým použité
          if tip=cislo[j] then ok:=true;
    until ok=false;
  cislo[i]:=tip;     //dosadí overené číslo (číslo, ktoré ešte nebolo vybrané)
  end;
for i:=1 to 6 do                   //vypísanie čísel do súboru
  writeln(l,cislo[i]);

closefile(l);
end;

end.

