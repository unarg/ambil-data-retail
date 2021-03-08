unit FRMRETAIL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, MyAccess,
  Vcl.ExtCtrls;

type
  TFRRETAIL = class(TForm)
    RETAIL: TMyConnection;
    kmbs2: TMyConnection;
    hero: TMyQuery;
    herod: TMyQuery;
    HEROX: TMyQuery;
    comd: TMyQuery;
    COM: TMyQuery;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure poretail;
    procedure pembelian;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FRRETAIL: TFRRETAIL;

implementation

{$R *.dfm}

procedure TFRRETAIL.Timer1Timer(Sender: TObject);
var
BUKTIPO,BUKTIBL,STATUS,MERK,TYPX,KODESX,NAMASX : STRING;
POX,BLX,I,cek,IDX : INTEGER;
siz,QTYZ : real;

begin

BUKTIPO:='';

cek:=0;

  HEROX.SQL.Clear;
  HEROX.SQL.text:='SELECT * from IMPORTDATA where tgl=date(now()) and POSTED=0 and proses=1 and cek=1 and TYP="R" ';
  HEROX.OPEN;

  if TRIM(herox.FieldByName('KODEM').AsString) = 'PO' then
  BEGIN
//    ShowMessage('PEMBELIAN');
    pembelian;

  END
  ELSE
  BEGIN
//    ShowMessage('PORETAIL');
    poretail;

  END;


end;


procedure TFRRETAIL.poretail;
var
BUKTIPO,BUKTIBL,STATUS,MERK,TYPX,KODESX,NAMASX : STRING;
POX,BLX,I,cek,IDX : INTEGER;
siz,QTYZ : real;

begin

  HEROX.SQL.Clear;
  HEROX.SQL.text:='SELECT * from IMPORTDATA where  tgl=date(now()) AND  POSTED=0 and kodesr='''' and cek=0 and  TYP=''R'' ';
  HEROX.OPEN;

  HEROX.First;
  while NOT HEROX.EOF do
  BEGIN

    if herox.FieldByName('kodem').AsString='BLG' then
    BEGIN

       MERK:='BLG';
       com.SQL.Clear;
       com.SQL.Text:='select rapo.POBUKTI,rapo.posupp as kodes,supplier.namasup as namas FROM bellagio.rapo left join bellagio.supplier on rapo.POSUPP=supplier.KODESUP where rapo.pobukti=:pono';
       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;
       if com.RecordCount >0 then
       begin

          hero.SQL.Clear;
          hero.SQL.Text:='UPDATE IMPORTDATA set kodesr=:kodesr ,namasr=:namasr where no_bukti=:no_bukti and typ=''R'' ';
          hero.Params.ParamByName('KODESR').Value := trim(com.FieldByName('kodes').value) ;
          hero.Params.ParamByName('NAMASR').Value := trim(com.FieldByName('namas').value) ;
          hero.Params.ParamByName('no_bukti').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
          hero.ExecSQL;

       end;

    END;


    IF herox.FieldByName('kodem').AsString='BRN' then
    BEGIN

       MERK:='BRN';


       com.SQL.Clear;
       com.SQL.Text:='select rapo.POBUKTI,rapo.posupp as kodes,supplier.namasup as namas FROM brunopremi.rapo left join brunopremi.supplier on rapo.POSUPP=supplier.KODESUP where rapo.pobukti=:pono';
       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;
       if com.RecordCount >0 then
       begin

          hero.SQL.Clear;
          hero.SQL.Text:='UPDATE IMPORTDATA set kodesr=:kodesr ,namasr=:namasr where no_bukti=:no_bukti and typ=''R'' ';
          hero.Params.ParamByName('KODESR').Value := trim(com.FieldByName('kodes').value) ;
          hero.Params.ParamByName('NAMASR').Value := trim(com.FieldByName('namas').value) ;
          hero.Params.ParamByName('no_bukti').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
          hero.ExecSQL;

       end;

    END;


    IF herox.FieldByName('kodem').AsString='ELV' then
    BEGIN
     MERK:='ELV';

     com.SQL.Clear;
       com.SQL.Text:='select rapo.POBUKTI,rapo.posupp as kodes,supplier.namasup as namas FROM elvio.rapo left join elvio.supplier on rapo.POSUPP=supplier.KODESUP where rapo.pobukti=:pono';
       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;
       if com.RecordCount >0 then
       begin

          hero.SQL.Clear;
          hero.SQL.Text:='UPDATE IMPORTDATA set kodesr=:kodesr ,namasr=:namasr where no_bukti=:no_bukti and typ=''R'' ';
          hero.Params.ParamByName('KODESR').Value := trim(com.FieldByName('kodes').value) ;
          hero.Params.ParamByName('NAMASR').Value := trim(com.FieldByName('namas').value) ;
          hero.Params.ParamByName('no_bukti').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
          hero.ExecSQL;

       end;

    END;

    IF herox.FieldByName('kodem').AsString='GRD' then
    BEGIN

     MERK:='GRD';
     com.SQL.Clear;
       com.SQL.Text:='select rapo.POBUKTI,rapo.posupp as kodes,supplier.namasup as namas FROM gerados.rapo left join gerados.supplier on rapo.POSUPP=supplier.KODESUP where rapo.pobukti=:pono';
       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;
       if com.RecordCount >0 then
       begin

          hero.SQL.Clear;
          hero.SQL.Text:='UPDATE IMPORTDATA set kodesr=:kodesr ,namasr=:namasr where no_bukti=:no_bukti and typ=''R'' ';
          hero.Params.ParamByName('KODESR').Value := trim(com.FieldByName('kodes').value) ;
          hero.Params.ParamByName('NAMASR').Value := trim(com.FieldByName('namas').value) ;
          hero.Params.ParamByName('no_bukti').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
          hero.ExecSQL;

       end;


    END;

    IF herox.FieldByName('kodem').AsString='GRY' then
    BEGIN


     MERK:='GRY';
     com.SQL.Clear;
       com.SQL.Text:='select rapo.POBUKTI,rapo.posupp as kodes,supplier.namasup as namas FROM gerry.rapo left join gerry.supplier on rapo.POSUPP=supplier.KODESUP where rapo.pobukti=:pono';
       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;
       if com.RecordCount >0 then
       begin

          hero.SQL.Clear;
          hero.SQL.Text:='UPDATE IMPORTDATA set kodesr=:kodesr ,namasr=:namasr where no_bukti=:no_bukti and typ=''R'' ';
          hero.Params.ParamByName('KODESR').Value := trim(com.FieldByName('kodes').value) ;
          hero.Params.ParamByName('NAMASR').Value := trim(com.FieldByName('namas').value) ;
          hero.Params.ParamByName('no_bukti').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
          hero.ExecSQL;

       end;
    END;


    IF herox.FieldByName('kodem').AsString='GSH' then
    BEGIN

     MERK:='GSH';

       com.SQL.Clear;
       com.SQL.Text:='select rapo.POBUKTI,rapo.posupp as kodes,supplier.namasup as namas FROM gosh.rapo left join gosh.supplier on rapo.POSUPP=supplier.KODESUP where rapo.pobukti=:pono';
       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;
       if com.RecordCount >0 then
       begin

          hero.SQL.Clear;
          hero.SQL.Text:='UPDATE IMPORTDATA set kodesr=:kodesr ,namasr=:namasr where no_bukti=:no_bukti and typ=''R'' ';
          hero.Params.ParamByName('KODESR').Value := trim(com.FieldByName('kodes').value) ;
          hero.Params.ParamByName('NAMASR').Value := trim(com.FieldByName('namas').value) ;
          hero.Params.ParamByName('no_bukti').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
          hero.ExecSQL;

       end;
    END;


    IF herox.FieldByName('kodem').AsString='JOP' then
    BEGIN

     MERK:='JOP';

     com.SQL.Clear;
       com.SQL.Text:='select rapo.POBUKTI,rapo.posupp as kodes,supplier.namasup as namas FROM joop.rapo left join joop.supplier on rapo.POSUPP=supplier.KODESUP where rapo.pobukti=:pono';
       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;
       if com.RecordCount >0 then
       begin

          hero.SQL.Clear;
          hero.SQL.Text:='UPDATE IMPORTDATA set kodesr=:kodesr ,namasr=:namasr where no_bukti=:no_bukti and typ=''R'' ';
          hero.Params.ParamByName('KODESR').Value := trim(com.FieldByName('kodes').value) ;
          hero.Params.ParamByName('NAMASR').Value := trim(com.FieldByName('namas').value) ;
          hero.Params.ParamByName('no_bukti').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
          hero.ExecSQL;

       end;


    END;


    IF herox.FieldByName('kodem').AsString='RTL' then
    BEGIN

     MERK:='RTL';


     com.SQL.Clear;
       com.SQL.Text:='select rapo.POBUKTI,rapo.posupp as kodes,supplier.namasup as namas FROM rotelli.rapo left join rotelli.supplier on rapo.POSUPP=supplier.KODESUP where rapo.pobukti=:pono';
       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;
       if com.RecordCount >0 then
       begin

          hero.SQL.Clear;
          hero.SQL.Text:='UPDATE IMPORTDATA set kodesr=:kodesr ,namasr=:namasr where no_bukti=:no_bukti and typ=''R'' ';
          hero.Params.ParamByName('KODESR').Value := trim(com.FieldByName('kodes').value) ;
          hero.Params.ParamByName('NAMASR').Value := trim(com.FieldByName('namas').value) ;
          hero.Params.ParamByName('no_bukti').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
          hero.ExecSQL;

       end;

    END;


     IF herox.FieldByName('kodem').AsString='TRS' then
    BEGIN

     MERK:='TRS';

     com.SQL.Clear;
       com.SQL.Text:='select rapo.POBUKTI,rapo.posupp as kodes,supplier.namasup as namas FROM torresin.rapo left join torresin.supplier on rapo.POSUPP=supplier.KODESUP where rapo.pobukti=:pono';
       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;
       if com.RecordCount >0 then
       begin

hero.SQL.Clear;
hero.SQL.Text:='UPDATE IMPORTDATA set kodesr=:kodesr ,namasr=:namasr where no_bukti=:no_bukti and typ=''R'' ';
hero.Params.ParamByName('KODESR').Value := trim(com.FieldByName('kodes').value) ;
hero.Params.ParamByName('NAMASR').Value := trim(com.FieldByName('namas').value) ;
hero.Params.ParamByName('no_bukti').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
hero.ExecSQL;

       end;

    END;


    HEROX.Next;
  END;




        HEROX.SQL.Clear;
        HEROX.SQL.text:='SELECT * from IMPORTDATA where tgl=date(now())  and POSTED=0 and proses=1 and cek=1 and TYP=''R'' ';
        HEROX.OPEN;

  HEROX.First;
  while NOT HEROX.EOF do
  BEGIN

    IDX:= herox.FieldByName('NO_ID').value;
    KODESX := trim(herox.FieldByName('KODES').value) ;
    NAMASX := trim(herox.FieldByName('NAMAS').value) ;

    STATUS:='Gagal';
    POX:=0;
    BLX:=0;

    hero.SQL.Clear;
    hero.SQL.Text:='select no_bukti from po where no_bukti =:no_po ';
    hero.Params.ParamByName('no_po').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
    hero.OPEN;


    if hero.RecordCount = 0 then
     begin



    if herox.FieldByName('kodem').AsString='BLG' then
    BEGIN

       MERK:='BLG';

       com.SQL.Clear;
       com.SQL.Text:=' select no_bukti,kodes,supplier.namasup as namas,kodecab,tgl,concat(lpad(month(tgl),2,''0''),''/'',year(tgl)) as per,year(tgl) as yer,jtempo,kd_brg,kd,sum(jum34 ) as jum34,sum( jum35 ) as jum35,sum(jum36) as jum36,sum(jum37)as jum37,sum(jum38) as jum38, '
                     +' sum(jum39) as jum39 ,sum(jum40) as jum40,sum(jum41) as jum41,sum(jum42) as jum42, '
                    +' sum(jumh34 ) as jumh34,sum( jumh35 ) as jumh35,sum(jumh36) as jumh36,sum(jumh37)as jumh37,sum(jumh38) as jumh38, '
                     +' sum(jumh39) as jumh39 ,sum(jumh40) as jumh40,sum(jumh41) as jumh41,sum(jumh42) as jumh42,sum(poqty) as qty,produk,curr , rate ,harga1,harga,if(curr=''IDR'',''L'',''I'') as typ,''PO'' as flag,''B'' as gol '
                     +' from( select *,poqty/jumz*po34 as jum34,poqty/jumz*po35 as jum35 ,poqty/jumz*po36 as jum36, '
                      +' poqty/jumz*po37 as jum37,poqty/jumz*po38 as jum38,poqty/jumz*po39 as jum39,poqty/jumz*po40 as jum40,poqty/jumz*po41 as jum41,poqty/jumz*po42 as jum42, '
                      +' poqty/jumz*po34h as jumh34,poqty/jumz*po35h as jumh35 ,poqty/jumz*po36h as jumh36,poqty/jumz*po37h as jumh37,poqty/jumz*po38h as jumh38,poqty/jumz*po39h as jumh39,poqty/jumz*po40h as jumh40,poqty/jumz*po41h as jumh41,poqty/jumz*po42h as jumh42, '
                      +' concat(no_bukti,kodes,kodecab,kd_brg,jumz,box,packing) as  cek  from ( select pobukti as no_bukti, podari as kodecab,posupp as kodes,potgl as tgl,pokirim as jtempo,poartikel as kd_brg, '
                      +' po34+po34h+po35+po35h+po36+po36h+po37+po37h+po38+po38h+po39+po39h+po40+po40h+po41+po41h+po42+po42h as jumz,pokarton as box,poqty,concat(po34,po35,po36,po37,po38,po39,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po41h,po42h) as packing, '
                      +' po34,po35,po36,po37,po38,po39,po40,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po40h,po41h,po42h,if(pokode=''P'',''9'',''0'') as kd,poproduk as produk,if(pomatauang='''',''IDR'',if(pomatauang=''RP'',''IDR'',if(pohppsupp=0,''IDR'',pomatauang))) as curr, '
                      +' if(pomatauang<>'''',if(pohppsupp=0,poharpo,pohppsupp),poharpo) as harga1,poharpo as harga,if(pomatauang<>'''',if(pohppsupp=0,1,poharpo/pohppsupp),1) as rate '
                      +' from bellagio.rapo where pobukti=:pono order by pobukti  ) as aaa ) as hero left join bellagio.supplier on hero.kodes=supplier.kodesup   group by no_bukti,kd_brg,kd ' ;

       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;

    END
    ELSE IF herox.FieldByName('kodem').AsString='BRN' then
    BEGIN

       MERK:='BRN';
        //  brunopremi
       com.SQL.Clear;
       com.SQL.Text:=' select no_bukti,kodes,supplier.namasup as namas,kodecab,tgl,concat(lpad(month(tgl),2,''0''),''/'',year(tgl)) as per,year(tgl) as yer,jtempo,kd_brg,kd,sum(jum34 ) as jum34,sum( jum35 ) as jum35,sum(jum36) as jum36,sum(jum37)as jum37,sum(jum38) as jum38, '
                     +' sum(jum39) as jum39 ,sum(jum40) as jum40,sum(jum41) as jum41,sum(jum42) as jum42, '
                    +' sum(jumh34 ) as jumh34,sum( jumh35 ) as jumh35,sum(jumh36) as jumh36,sum(jumh37)as jumh37,sum(jumh38) as jumh38, '
                     +' sum(jumh39) as jumh39 ,sum(jumh40) as jumh40,sum(jumh41) as jumh41,sum(jumh42) as jumh42,sum(poqty) as qty,produk,curr , rate ,harga1,harga,if(curr=''IDR'',''L'',''I'') as typ,''PO'' as flag,''B'' as gol '
                     +' from( select *,poqty/jumz*po34 as jum34,poqty/jumz*po35 as jum35 ,poqty/jumz*po36 as jum36, '
                      +' poqty/jumz*po37 as jum37,poqty/jumz*po38 as jum38,poqty/jumz*po39 as jum39,poqty/jumz*po40 as jum40,poqty/jumz*po41 as jum41,poqty/jumz*po42 as jum42, '
                      +' poqty/jumz*po34h as jumh34,poqty/jumz*po35h as jumh35 ,poqty/jumz*po36h as jumh36,poqty/jumz*po37h as jumh37,poqty/jumz*po38h as jumh38,poqty/jumz*po39h as jumh39,poqty/jumz*po40h as jumh40,poqty/jumz*po41h as jumh41,poqty/jumz*po42h as jumh42, '
                      +' concat(no_bukti,kodes,kodecab,kd_brg,jumz,box,packing) as  cek  from ( select pobukti as no_bukti, podari as kodecab,posupp as kodes,potgl as tgl,pokirim as jtempo,poartikel as kd_brg, '
                      +' po34+po34h+po35+po35h+po36+po36h+po37+po37h+po38+po38h+po39+po39h+po40+po40h+po41+po41h+po42+po42h as jumz,pokarton as box,poqty,concat(po34,po35,po36,po37,po38,po39,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po41h,po42h) as packing, '
                      +' po34,po35,po36,po37,po38,po39,po40,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po40h,po41h,po42h,if(pokode=''P'',''9'',''0'') as kd,poproduk as produk,if(pomatauang='''',''IDR'',if(pomatauang=''RP'',''IDR'',if(pohppsupp=0,''IDR'',pomatauang))) as curr, '
                      +' if(pomatauang<>'''',if(pohppsupp=0,poharpo,pohppsupp),poharpo) as harga1,poharpo as harga,if(pomatauang<>'''',if(pohppsupp=0,1,poharpo/pohppsupp),1) as rate '
                      +' from brunopremi.rapo where pobukti=:pono order by pobukti  ) as aaa ) as hero left join brunopremi.supplier on hero.kodes=supplier.kodesup   group by no_bukti,kd_brg,kd ' ;

       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;

    END
    ELSE IF herox.FieldByName('kodem').AsString='ELV' then
    BEGIN


     MERK:='ELV';
      //elvio
      com.SQL.Clear;
       com.SQL.Text:=' select no_bukti,kodes,supplier.namasup as namas,kodecab,tgl,concat(lpad(month(tgl),2,''0''),''/'',year(tgl)) as per,year(tgl) as yer,jtempo,kd_brg,kd,sum(jum34 ) as jum34,sum( jum35 ) as jum35,sum(jum36) as jum36,sum(jum37)as jum37,sum(jum38) as jum38, '
                     +' sum(jum39) as jum39 ,sum(jum40) as jum40,sum(jum41) as jum41,sum(jum42) as jum42, '
                    +' sum(jumh34 ) as jumh34,sum( jumh35 ) as jumh35,sum(jumh36) as jumh36,sum(jumh37)as jumh37,sum(jumh38) as jumh38, '
                     +' sum(jumh39) as jumh39 ,sum(jumh40) as jumh40,sum(jumh41) as jumh41,sum(jumh42) as jumh42,sum(poqty) as qty,produk,curr , rate ,harga1,harga,if(curr=''IDR'',''L'',''I'') as typ,''PO'' as flag,''B'' as gol '
                     +' from( select *,poqty/jumz*po34 as jum34,poqty/jumz*po35 as jum35 ,poqty/jumz*po36 as jum36, '
                      +' poqty/jumz*po37 as jum37,poqty/jumz*po38 as jum38,poqty/jumz*po39 as jum39,poqty/jumz*po40 as jum40,poqty/jumz*po41 as jum41,poqty/jumz*po42 as jum42, '
                      +' poqty/jumz*po34h as jumh34,poqty/jumz*po35h as jumh35 ,poqty/jumz*po36h as jumh36,poqty/jumz*po37h as jumh37,poqty/jumz*po38h as jumh38,poqty/jumz*po39h as jumh39,poqty/jumz*po40h as jumh40,poqty/jumz*po41h as jumh41,poqty/jumz*po42h as jumh42, '
                      +' concat(no_bukti,kodes,kodecab,kd_brg,jumz,box,packing) as  cek  from ( select pobukti as no_bukti, podari as kodecab,posupp as kodes,potgl as tgl,pokirim as jtempo,poartikel as kd_brg, '
                      +' po34+po34h+po35+po35h+po36+po36h+po37+po37h+po38+po38h+po39+po39h+po40+po40h+po41+po41h+po42+po42h as jumz,pokarton as box,poqty,concat(po34,po35,po36,po37,po38,po39,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po41h,po42h) as packing, '
                      +' po34,po35,po36,po37,po38,po39,po40,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po40h,po41h,po42h,if(pokode=''P'',''9'',''0'') as kd,poproduk as produk,if(pomatauang='''',''IDR'',if(pomatauang=''RP'',''IDR'',if(pohppsupp=0,''IDR'',pomatauang))) as curr, '
                      +' if(pomatauang<>'''',if(pohppsupp=0,poharpo,pohppsupp),poharpo) as harga1,poharpo as harga,if(pomatauang<>'''',if(pohppsupp=0,1,poharpo/pohppsupp),1) as rate '
                      +' from elvio.rapo where pobukti=:pono order by pobukti  ) as aaa ) as hero left join elvio.supplier on hero.kodes=supplier.kodesup   group by no_bukti,kd_brg,kd ' ;

       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;

     END
    ELSE IF herox.FieldByName('kodem').AsString='GRD' then
    BEGIN

     MERK:='GRD';

      //gerados
      com.SQL.Clear;
       com.SQL.Text:=' select no_bukti,kodes,supplier.namasup as namas,kodecab,tgl,concat(lpad(month(tgl),2,''0''),''/'',year(tgl)) as per,year(tgl) as yer,jtempo,kd_brg,kd,sum(jum34 ) as jum34,sum( jum35 ) as jum35,sum(jum36) as jum36,sum(jum37)as jum37,sum(jum38) as jum38, '
                     +' sum(jum39) as jum39 ,sum(jum40) as jum40,sum(jum41) as jum41,sum(jum42) as jum42, '
                    +' sum(jumh34 ) as jumh34,sum( jumh35 ) as jumh35,sum(jumh36) as jumh36,sum(jumh37)as jumh37,sum(jumh38) as jumh38, '
                     +' sum(jumh39) as jumh39 ,sum(jumh40) as jumh40,sum(jumh41) as jumh41,sum(jumh42) as jumh42,sum(poqty) as qty,produk,curr , rate ,harga1,harga,if(curr=''IDR'',''L'',''I'') as typ,''PO'' as flag,''B'' as gol '
                     +' from( select *,poqty/jumz*po34 as jum34,poqty/jumz*po35 as jum35 ,poqty/jumz*po36 as jum36, '
                      +' poqty/jumz*po37 as jum37,poqty/jumz*po38 as jum38,poqty/jumz*po39 as jum39,poqty/jumz*po40 as jum40,poqty/jumz*po41 as jum41,poqty/jumz*po42 as jum42, '
                      +' poqty/jumz*po34h as jumh34,poqty/jumz*po35h as jumh35 ,poqty/jumz*po36h as jumh36,poqty/jumz*po37h as jumh37,poqty/jumz*po38h as jumh38,poqty/jumz*po39h as jumh39,poqty/jumz*po40h as jumh40,poqty/jumz*po41h as jumh41,poqty/jumz*po42h as jumh42, '
                      +' concat(no_bukti,kodes,kodecab,kd_brg,jumz,box,packing) as  cek  from ( select pobukti as no_bukti, podari as kodecab,posupp as kodes,potgl as tgl,pokirim as jtempo,poartikel as kd_brg, '
                      +' po34+po34h+po35+po35h+po36+po36h+po37+po37h+po38+po38h+po39+po39h+po40+po40h+po41+po41h+po42+po42h as jumz,pokarton as box,poqty,concat(po34,po35,po36,po37,po38,po39,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po41h,po42h) as packing, '
                      +' po34,po35,po36,po37,po38,po39,po40,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po40h,po41h,po42h,if(pokode=''P'',''9'',''0'') as kd,poproduk as produk,if(pomatauang='''',''IDR'',if(pomatauang=''RP'',''IDR'',if(pohppsupp=0,''IDR'',pomatauang))) as curr, '
                      +' if(pomatauang<>'''',if(pohppsupp=0,poharpo,pohppsupp),poharpo) as harga1,poharpo as harga,if(pomatauang<>'''',if(pohppsupp=0,1,poharpo/pohppsupp),1) as rate '
                      +' from gerados.rapo where pobukti=:pono order by pobukti  ) as aaa ) as hero left join gerados.supplier on hero.kodes=supplier.kodesup   group by no_bukti,kd_brg,kd ' ;

       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;


    END
    ELSE IF herox.FieldByName('kodem').AsString='GRY' then
    BEGIN


     MERK:='GRY';
      //gerry
      com.SQL.Clear;
       com.SQL.Text:=' select no_bukti,kodes,supplier.namasup as namas,kodecab,tgl,concat(lpad(month(tgl),2,''0''),''/'',year(tgl)) as per,year(tgl) as yer,jtempo,kd_brg,kd,sum(jum34 ) as jum34,sum( jum35 ) as jum35,sum(jum36) as jum36,sum(jum37)as jum37,sum(jum38) as jum38, '
                     +' sum(jum39) as jum39 ,sum(jum40) as jum40,sum(jum41) as jum41,sum(jum42) as jum42, '
                    +' sum(jumh34 ) as jumh34,sum( jumh35 ) as jumh35,sum(jumh36) as jumh36,sum(jumh37)as jumh37,sum(jumh38) as jumh38, '
                     +' sum(jumh39) as jumh39 ,sum(jumh40) as jumh40,sum(jumh41) as jumh41,sum(jumh42) as jumh42,sum(poqty) as qty,produk,curr , rate ,harga1,harga,if(curr=''IDR'',''L'',''I'') as typ,''PO'' as flag,''B'' as gol '
                     +' from( select *,poqty/jumz*po34 as jum34,poqty/jumz*po35 as jum35 ,poqty/jumz*po36 as jum36, '
                      +' poqty/jumz*po37 as jum37,poqty/jumz*po38 as jum38,poqty/jumz*po39 as jum39,poqty/jumz*po40 as jum40,poqty/jumz*po41 as jum41,poqty/jumz*po42 as jum42, '
                      +' poqty/jumz*po34h as jumh34,poqty/jumz*po35h as jumh35 ,poqty/jumz*po36h as jumh36,poqty/jumz*po37h as jumh37,poqty/jumz*po38h as jumh38,poqty/jumz*po39h as jumh39,poqty/jumz*po40h as jumh40,poqty/jumz*po41h as jumh41,poqty/jumz*po42h as jumh42, '
                      +' concat(no_bukti,kodes,kodecab,kd_brg,jumz,box,packing) as  cek  from ( select pobukti as no_bukti, podari as kodecab,posupp as kodes,potgl as tgl,pokirim as jtempo,poartikel as kd_brg, '
                      +' po34+po34h+po35+po35h+po36+po36h+po37+po37h+po38+po38h+po39+po39h+po40+po40h+po41+po41h+po42+po42h as jumz,pokarton as box,poqty,concat(po34,po35,po36,po37,po38,po39,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po41h,po42h) as packing, '
                      +' po34,po35,po36,po37,po38,po39,po40,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po40h,po41h,po42h,if(pokode=''P'',''9'',''0'') as kd,poproduk as produk,if(pomatauang='''',''IDR'',if(pomatauang=''RP'',''IDR'',if(pohppsupp=0,''IDR'',pomatauang))) as curr, '
                      +' if(pomatauang<>'''',if(pohppsupp=0,poharpo,pohppsupp),poharpo) as harga1,poharpo as harga,if(pomatauang<>'''',if(pohppsupp=0,1,poharpo/pohppsupp),1) as rate '
                      +' from gerry.rapo where pobukti=:pono order by pobukti  ) as aaa ) as hero left join gerry.supplier on hero.kodes=supplier.kodesup   group by no_bukti,kd_brg,kd ' ;

       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;


    END
    ELSE IF herox.FieldByName('kodem').AsString='GSH' then
    BEGIN


     MERK:='GSH';
      //gosh
      com.SQL.Clear;
       com.SQL.Text:=' select no_bukti,kodes,supplier.namasup as namas,kodecab,tgl,concat(lpad(month(tgl),2,''0''),''/'',year(tgl)) as per,year(tgl) as yer,jtempo,kd_brg,kd,sum(jum34 ) as jum34,sum( jum35 ) as jum35,sum(jum36) as jum36,sum(jum37)as jum37,sum(jum38) as jum38, '
                     +' sum(jum39) as jum39 ,sum(jum40) as jum40,sum(jum41) as jum41,sum(jum42) as jum42, '
                    +' sum(jumh34 ) as jumh34,sum( jumh35 ) as jumh35,sum(jumh36) as jumh36,sum(jumh37)as jumh37,sum(jumh38) as jumh38, '
                     +' sum(jumh39) as jumh39 ,sum(jumh40) as jumh40,sum(jumh41) as jumh41,sum(jumh42) as jumh42,sum(poqty) as qty,produk,curr , rate ,harga1,harga,if(curr=''IDR'',''L'',''I'') as typ,''PO'' as flag,''B'' as gol '
                     +' from( select *,poqty/jumz*po34 as jum34,poqty/jumz*po35 as jum35 ,poqty/jumz*po36 as jum36, '
                      +' poqty/jumz*po37 as jum37,poqty/jumz*po38 as jum38,poqty/jumz*po39 as jum39,poqty/jumz*po40 as jum40,poqty/jumz*po41 as jum41,poqty/jumz*po42 as jum42, '
                      +' poqty/jumz*po34h as jumh34,poqty/jumz*po35h as jumh35 ,poqty/jumz*po36h as jumh36,poqty/jumz*po37h as jumh37,poqty/jumz*po38h as jumh38,poqty/jumz*po39h as jumh39,poqty/jumz*po40h as jumh40,poqty/jumz*po41h as jumh41,poqty/jumz*po42h as jumh42, '
                      +' concat(no_bukti,kodes,kodecab,kd_brg,jumz,box,packing) as  cek  from ( select pobukti as no_bukti, podari as kodecab,posupp as kodes,potgl as tgl,pokirim as jtempo,poartikel as kd_brg, '
                      +' po34+po34h+po35+po35h+po36+po36h+po37+po37h+po38+po38h+po39+po39h+po40+po40h+po41+po41h+po42+po42h as jumz,pokarton as box,poqty,concat(po34,po35,po36,po37,po38,po39,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po41h,po42h) as packing, '
                      +' po34,po35,po36,po37,po38,po39,po40,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po40h,po41h,po42h,if(pokode=''P'',''9'',''0'') as kd,poproduk as produk,if(pomatauang='''',''IDR'',if(pomatauang=''RP'',''IDR'',if(pohppsupp=0,''IDR'',pomatauang))) as curr, '
                      +' if(pomatauang<>'''',if(pohppsupp=0,poharpo,pohppsupp),poharpo) as harga1,poharpo as harga,if(pomatauang<>'''',if(pohppsupp=0,1,poharpo/pohppsupp),1) as rate '
                      +' from gosh.rapo where pobukti=:pono order by pobukti  ) as aaa ) as hero left join gosh.supplier on hero.kodes=supplier.kodesup   group by no_bukti,kd_brg,kd ' ;

       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;


    END
    ELSE IF herox.FieldByName('kodem').AsString='JOP' then
    BEGIN

     MERK:='JOP';

    //joop

       com.SQL.Clear;
       com.SQL.Text:=' select no_bukti,kodes,supplier.namasup as namas,kodecab,tgl,concat(lpad(month(tgl),2,''0''),''/'',year(tgl)) as per,year(tgl) as yer,jtempo,kd_brg,kd,sum(jum34 ) as jum34,sum( jum35 ) as jum35,sum(jum36) as jum36,sum(jum37)as jum37,sum(jum38) as jum38, '
                     +' sum(jum39) as jum39 ,sum(jum40) as jum40,sum(jum41) as jum41,sum(jum42) as jum42, '
                    +' sum(jumh34 ) as jumh34,sum( jumh35 ) as jumh35,sum(jumh36) as jumh36,sum(jumh37)as jumh37,sum(jumh38) as jumh38, '
                     +' sum(jumh39) as jumh39 ,sum(jumh40) as jumh40,sum(jumh41) as jumh41,sum(jumh42) as jumh42,sum(poqty) as qty,produk,curr , rate ,harga1,harga,if(curr=''IDR'',''L'',''I'') as typ,''PO'' as flag,''B'' as gol '
                     +' from( select *,poqty/jumz*po34 as jum34,poqty/jumz*po35 as jum35 ,poqty/jumz*po36 as jum36, '
                      +' poqty/jumz*po37 as jum37,poqty/jumz*po38 as jum38,poqty/jumz*po39 as jum39,poqty/jumz*po40 as jum40,poqty/jumz*po41 as jum41,poqty/jumz*po42 as jum42, '
                      +' poqty/jumz*po34h as jumh34,poqty/jumz*po35h as jumh35 ,poqty/jumz*po36h as jumh36,poqty/jumz*po37h as jumh37,poqty/jumz*po38h as jumh38,poqty/jumz*po39h as jumh39,poqty/jumz*po40h as jumh40,poqty/jumz*po41h as jumh41,poqty/jumz*po42h as jumh42, '
                      +' concat(no_bukti,kodes,kodecab,kd_brg,jumz,box,packing) as  cek  from ( select pobukti as no_bukti, podari as kodecab,posupp as kodes,potgl as tgl,pokirim as jtempo,poartikel as kd_brg, '
                      +' po34+po34h+po35+po35h+po36+po36h+po37+po37h+po38+po38h+po39+po39h+po40+po40h+po41+po41h+po42+po42h as jumz,pokarton as box,poqty,concat(po34,po35,po36,po37,po38,po39,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po41h,po42h) as packing, '
                      +' po34,po35,po36,po37,po38,po39,po40,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po40h,po41h,po42h,if(pokode=''P'',''9'',''0'') as kd,poproduk as produk,if(pomatauang='''',''IDR'',if(pomatauang=''RP'',''IDR'',if(pohppsupp=0,''IDR'',pomatauang))) as curr, '
                      +' if(pomatauang<>'''',if(pohppsupp=0,poharpo,pohppsupp),poharpo) as harga1,poharpo as harga,if(pomatauang<>'''',if(pohppsupp=0,1,poharpo/pohppsupp),1) as rate '
                      +' from joop.rapo where pobukti=:pono order by pobukti  ) as aaa ) as hero left join joop.supplier on hero.kodes=supplier.kodesup   group by no_bukti,kd_brg,kd ' ;

       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;


    END
    ELSE IF herox.FieldByName('kodem').AsString='RTL' then
    BEGIN

     MERK:='RTL';
     //rotelli

      com.SQL.Clear;
       com.SQL.Text:=' select no_bukti,kodes,supplier.namasup as namas,kodecab,tgl,concat(lpad(month(tgl),2,''0''),''/'',year(tgl)) as per,year(tgl) as yer,jtempo,kd_brg,kd,sum(jum34 ) as jum34,sum( jum35 ) as jum35,sum(jum36) as jum36,sum(jum37)as jum37,sum(jum38) as jum38, '
                     +' sum(jum39) as jum39 ,sum(jum40) as jum40,sum(jum41) as jum41,sum(jum42) as jum42, '
                    +' sum(jumh34 ) as jumh34,sum( jumh35 ) as jumh35,sum(jumh36) as jumh36,sum(jumh37)as jumh37,sum(jumh38) as jumh38, '
                     +' sum(jumh39) as jumh39 ,sum(jumh40) as jumh40,sum(jumh41) as jumh41,sum(jumh42) as jumh42,sum(poqty) as qty,produk,curr , rate ,harga1,harga,if(curr=''IDR'',''L'',''I'') as typ,''PO'' as flag,''B'' as gol '
                     +' from( select *,poqty/jumz*po34 as jum34,poqty/jumz*po35 as jum35 ,poqty/jumz*po36 as jum36, '
                      +' poqty/jumz*po37 as jum37,poqty/jumz*po38 as jum38,poqty/jumz*po39 as jum39,poqty/jumz*po40 as jum40,poqty/jumz*po41 as jum41,poqty/jumz*po42 as jum42, '
                      +' poqty/jumz*po34h as jumh34,poqty/jumz*po35h as jumh35 ,poqty/jumz*po36h as jumh36,poqty/jumz*po37h as jumh37,poqty/jumz*po38h as jumh38,poqty/jumz*po39h as jumh39,poqty/jumz*po40h as jumh40,poqty/jumz*po41h as jumh41,poqty/jumz*po42h as jumh42, '
                      +' concat(no_bukti,kodes,kodecab,kd_brg,jumz,box,packing) as  cek  from ( select pobukti as no_bukti, podari as kodecab,posupp as kodes,potgl as tgl,pokirim as jtempo,poartikel as kd_brg, '
                      +' po34+po34h+po35+po35h+po36+po36h+po37+po37h+po38+po38h+po39+po39h+po40+po40h+po41+po41h+po42+po42h as jumz,pokarton as box,poqty,concat(po34,po35,po36,po37,po38,po39,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po41h,po42h) as packing, '
                      +' po34,po35,po36,po37,po38,po39,po40,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po40h,po41h,po42h,if(pokode=''P'',''9'',''0'') as kd,poproduk as produk,if(pomatauang='''',''IDR'',if(pomatauang=''RP'',''IDR'',if(pohppsupp=0,''IDR'',pomatauang))) as curr, '
                      +' if(pomatauang<>'''',if(pohppsupp=0,poharpo,pohppsupp),poharpo) as harga1,poharpo as harga,if(pomatauang<>'''',if(pohppsupp=0,1,poharpo/pohppsupp),1) as rate '
                      +' from rotelli.rapo where pobukti=:pono order by pobukti  ) as aaa ) as hero left join rotelli.supplier on hero.kodes=supplier.kodesup   group by no_bukti,kd_brg,kd ' ;

       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;


    END
    ELSE IF herox.FieldByName('kodem').AsString='TRS' then
    BEGIN

     MERK:='TRS';
     //toresin

       com.SQL.Clear;
       com.SQL.Text:=' select no_bukti,kodes,supplier.namasup as namas,kodecab,tgl,concat(lpad(month(tgl),2,''0''),''/'',year(tgl)) as per,year(tgl) as yer,jtempo,kd_brg,kd,sum(jum34 ) as jum34,sum( jum35 ) as jum35,sum(jum36) as jum36,sum(jum37)as jum37,sum(jum38) as jum38, '
                     +' sum(jum39) as jum39 ,sum(jum40) as jum40,sum(jum41) as jum41,sum(jum42) as jum42, '
                    +' sum(jumh34 ) as jumh34,sum( jumh35 ) as jumh35,sum(jumh36) as jumh36,sum(jumh37)as jumh37,sum(jumh38) as jumh38, '
                     +' sum(jumh39) as jumh39 ,sum(jumh40) as jumh40,sum(jumh41) as jumh41,sum(jumh42) as jumh42,sum(poqty) as qty,produk,curr , rate ,harga1,harga,if(curr=''IDR'',''L'',''I'') as typ,''PO'' as flag,''B'' as gol '
                     +' from( select *,poqty/jumz*po34 as jum34,poqty/jumz*po35 as jum35 ,poqty/jumz*po36 as jum36, '
                      +' poqty/jumz*po37 as jum37,poqty/jumz*po38 as jum38,poqty/jumz*po39 as jum39,poqty/jumz*po40 as jum40,poqty/jumz*po41 as jum41,poqty/jumz*po42 as jum42, '
                      +' poqty/jumz*po34h as jumh34,poqty/jumz*po35h as jumh35 ,poqty/jumz*po36h as jumh36,poqty/jumz*po37h as jumh37,poqty/jumz*po38h as jumh38,poqty/jumz*po39h as jumh39,poqty/jumz*po40h as jumh40,poqty/jumz*po41h as jumh41,poqty/jumz*po42h as jumh42, '
                      +' concat(no_bukti,kodes,kodecab,kd_brg,jumz,box,packing) as  cek  from ( select pobukti as no_bukti, podari as kodecab,posupp as kodes,potgl as tgl,pokirim as jtempo,poartikel as kd_brg, '
                      +' po34+po34h+po35+po35h+po36+po36h+po37+po37h+po38+po38h+po39+po39h+po40+po40h+po41+po41h+po42+po42h as jumz,pokarton as box,poqty,concat(po34,po35,po36,po37,po38,po39,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po41h,po42h) as packing, '
                      +' po34,po35,po36,po37,po38,po39,po40,po41,po42,po34h,po35h,po36h,po37h,po38h,po39h,po40h,po41h,po42h,if(pokode=''P'',''9'',''0'') as kd,poproduk as produk,if(pomatauang='''',''IDR'',if(pomatauang=''RP'',''IDR'',if(pohppsupp=0,''IDR'',pomatauang))) as curr, '
                      +' if(pomatauang<>'''',if(pohppsupp=0,poharpo,pohppsupp),poharpo) as harga1,poharpo as harga,if(pomatauang<>'''',if(pohppsupp=0,1,poharpo/pohppsupp),1) as rate '
                      +' from toresin.rapo where pobukti=:pono order by pobukti  ) as aaa ) as hero left join toresin.supplier on hero.kodes=supplier.kodesup   group by no_bukti,kd_brg,kd ' ;

       COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
       COM.OPEN;

    END;


      if com.RecordCount > 0 then
      begin


                COM.First;
                while NOT COM.EOF do
                BEGIN

                   POX:=1;
                   STATUS:='Berhasil';

                        //  ShowMessage('1');


                   if COM.FieldByName('PRODUK').AsString='SHOES' then
                   begin



                               for I := 1 to 18 do
                               BEGIN

                                  QTYZ:=0 ;
                                  SIZ:=0;


                                if I=1 then
                                begin


                                  QTYZ:=COM.FieldByName('JUM34').value ;
                                  SIZ:=34;
                                END
                                else if I=2 then
                                begin

                                  QTYZ:=COM.FieldByName('JUM35').value ;
                                  SIZ:=35;
                                end
                                 else if I=3 then
                                begin

                                  QTYZ:=COM.FieldByName('JUM36').value ;
                                  SIZ:=36;
                                end
                                 else if I=4 then
                                begin

                                  QTYZ:=COM.FieldByName('JUM37').value ;
                                  SIZ:=37;
                                END
                                else if I=5 then
                                begin

                                  QTYZ:=COM.FieldByName('JUM38').value ;
                                  SIZ:=38;

                                END
                                else if I=6 then
                                begin

                                  QTYZ:=COM.FieldByName('JUM39').value ;
                                  SIZ:=39;

                                 END
                                else if I=7 then
                                begin

                                  QTYZ:=COM.FieldByName('JUM40').value ;
                                  SIZ:=40;

                                END
                                else if I=8 then
                                begin

                                  QTYZ:=COM.FieldByName('JUM41').value ;
                                  SIZ:=41;

                                END
                                else if I=9 then
                                begin

                                  QTYZ:=COM.FieldByName('JUM42').value ;
                                  SIZ:=42;
                                END
                                else if I=10 then
                                begin

                                  QTYZ:=COM.FieldByName('JUMH34').value ;
                                  SIZ:=34.5;
                                END
                                else if I=11 then
                                begin

                                  QTYZ:=COM.FieldByName('JUMH35').value ;
                                  SIZ:=35.5;

                                END
                                else if I=12 then
                                begin

                                  QTYZ:=COM.FieldByName('JUMH36').value ;
                                  SIZ:=36.5;

                                END
                                else if I=13 then
                                begin

                                  QTYZ:=COM.FieldByName('JUMH37').value ;
                                  SIZ:=37.5;

                                END
                                else if I=14 then
                                begin

                                  QTYZ:=COM.FieldByName('JUMH38').value ;
                                  SIZ:=38.5;

                                END
                                else if I=15 then
                                begin

                                  QTYZ:=COM.FieldByName('JUMH39').value ;
                                  SIZ:=39.5;

                                END
                                else if I=16 then
                                begin

                                  QTYZ:=COM.FieldByName('JUMH40').value ;
                                  SIZ:=40.5;
                                end
                                else if I=17 then
                                begin

                                  QTYZ:=COM.FieldByName('JUMH41').value ;
                                  SIZ:=41.5;

                                end
                                else if I=18 then
                                begin

                                  QTYZ:=COM.FieldByName('JUMH42').value ;
                                  SIZ:=42.5;

                                end;


                                 if QTYZ <> 0 then
                                 BEGIN



                                  hero.SQL.Clear;
                                  hero.SQL.Add('INSERT INTO POD ( NO_BUKTI,KD_BRG,SIZ,QTY,SISA_QTY, HARGA, TOTAL, HARGA1, TOTAL1,KD,KODECAB,PRODUK,GOL,PER,TYP ) VALUES  ( '
                                              +'  :NO_BUKTI,:KD_BRG,:SIZ,:QTY,:QTY,:HARGA,:total,:HARGA1,:TOTAL1 ,:KD,:KODECAB,:PRODUK,''B'',:PER,:TYP  ) ');

                                  hero.Params.ParamByName('NO_BUKTI').Value := trim(com.FieldByName('NO_BUKTI').asstring);
                                  hero.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').asstring);
                                  hero.Params.ParamByName('QTY').Value := QTYZ;
                                  hero.Params.ParamByName('SIZ').Value := SIZ;
                                  hero.Params.ParamByName('TOTAL').Value := com.FieldByName('HARGA').VALUE*QTYZ;
                                  hero.Params.ParamByName('HARGA').Value := com.FieldByName('HARGA').VALUE;
                                  hero.Params.ParamByName('TOTAL1').Value := com.FieldByName('HARGA1').VALUE*QTYZ;
                                  hero.Params.ParamByName('HARGA1').Value := com.FieldByName('HARGA1').VALUE;
                                  hero.Params.ParamByName('KD').Value := trim(com.FieldByName('KD').asstring);
                                  hero.Params.ParamByName('KODECAB').Value := trim(com.FieldByName('KODECAB').asstring);
                                  hero.Params.ParamByName('PRODUK').Value := trim(com.FieldByName('PRODUK').asstring);
                                  hero.Params.ParamByName('HARGA1').Value := com.FieldByName('HARGA1').VALUE;
                                  hero.Params.ParamByName('PER').Value := trim(com.FieldByName('PER').asstring);
                                  hero.Params.ParamByName('TYP').Value := trim(com.FieldByName('TYP').asstring);
                                  hero.ExecSQL;



                                      if herox.FieldByName('kodem').AsString='BLG' then
                                      BEGIN
                                         MERK:='BLG';

                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM bellagio.barang WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='BRN' then
                                      BEGIN

                                         MERK:='BRN';

                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM brunopremi.barang WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='ELV' then
                                      BEGIN


                                       MERK:='ELV';


                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM elvio.barang WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                       END
                                      ELSE IF herox.FieldByName('kodem').AsString='GRD' then
                                      BEGIN

                                       MERK:='GRD';


                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM gerados.barang  WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='GRY' then
                                      BEGIN
                                      MERK:='BRY';


                                            COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM gerry.barang  WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='GSH' then
                                      BEGIN
                                       MERK:='GSH';


                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM gosh.barang  WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='JOP' then
                                      BEGIN
                                       MERK:='JOP';


                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM joop.barang  WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='RTL' then
                                      BEGIN

                                       MERK:='RTL';


                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM rotelli.barang  WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='TRS' then
                                      BEGIN

                                       MERK:='TRS';


                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM torresin.barang  WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;

                                      END;



                                   HERO.SQL.Clear;
                                   HERO.SQL.Text:='CALL CEKBRG( :KD_BRG,:SATUAN,:SIZ ,:KODECAB,:KD,:PRODUK,:WARNA,:YER,:BRAND)';
                                   HERO.Params.ParamByName('KD_BRG').Value := trim(comd.FieldByName('ARTIKEL').value) ;
                                   HERO.Params.ParamByName('SATUAN').Value := trim(comd.FieldByName('SATUAN').value) ;
                                   HERO.Params.ParamByName('SIZ').Value :=SIZ;
                                   HERO.Params.ParamByName('BRAND').Value :=MERK;
                                   HERO.Params.ParamByName('KODECAB').Value := trim(com.FieldByName('KODECAB').value) ;
                                   HERO.Params.ParamByName('KD').Value := trim(com.FieldByName('KD').ASSTRING) ;
                                   HERO.Params.ParamByName('PRODUK').Value := trim(comd.FieldByName('PRODUK').value) ;
                                   HERO.Params.ParamByName('WARNA').Value := trim(comd.FieldByName('WARNA').value) ;
                                   HERO.Params.ParamByName('YER').Value :=com.FieldByName('yer').value ;
                                   HERO.ExecSQL;





                                  end;



                               END;


                   end
                   else
                   begin




                                  hero.SQL.Clear;
                                  hero.SQL.Add('INSERT INTO POD ( NO_BUKTI,KD_BRG,SIZ,QTY,SISA_QTY, HARGA, TOTAL, HARGA1, TOTAL1,KD,KODECAB,PRODUK,GOL,PER,TYP ) VALUES  ( '
                                              +'  :NO_BUKTI,:KD_BRG,:SIZ,:QTY,:QTY,:HARGA,:total,:HARGA1,:TOTAL1 ,:KD,:KODECAB,:PRODUK,''B'',:PER,:TYP  ) ');

                                  hero.Params.ParamByName('NO_BUKTI').Value := trim(com.FieldByName('NO_BUKTI').asstring);
                                  hero.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').asstring);
                                  hero.Params.ParamByName('QTY').Value :=com.FieldByName('QTY').VALUE ;
                                  hero.Params.ParamByName('SIZ').Value := 0;
                                  hero.Params.ParamByName('TOTAL').Value := com.FieldByName('HARGA').VALUE*com.FieldByName('QTY').VALUE;
                                  hero.Params.ParamByName('HARGA').Value := com.FieldByName('HARGA').VALUE;
                                  hero.Params.ParamByName('TOTAL1').Value := com.FieldByName('HARGA1').VALUE*com.FieldByName('QTY').VALUE;
                                  hero.Params.ParamByName('HARGA1').Value := com.FieldByName('HARGA1').VALUE;
                                  hero.Params.ParamByName('KD').Value := trim(com.FieldByName('KD').asstring);
                                  hero.Params.ParamByName('KODECAB').Value := trim(com.FieldByName('KODECAB').asstring);
                                  hero.Params.ParamByName('PRODUK').Value := trim(com.FieldByName('PRODUK').asstring);
                                  hero.Params.ParamByName('HARGA1').Value := com.FieldByName('HARGA1').VALUE;
                                  hero.Params.ParamByName('PER').Value := trim(com.FieldByName('PER').asstring);
                                  hero.Params.ParamByName('TYP').Value:=TRIM(COM.FieldByName('TYP').value);
                                  hero.ExecSQL;



                                      if herox.FieldByName('kodem').AsString='BLG' then
                                      BEGIN
                                         MERK:='BLG';

                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM bellagio.barang WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='BRN' then
                                      BEGIN

                                         MERK:='BRN';

                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM brunopremi.barang WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='ELV' then
                                      BEGIN


                                       MERK:='ELV';


                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM elvio.barang WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                       END
                                      ELSE IF herox.FieldByName('kodem').AsString='GRD' then
                                      BEGIN

                                       MERK:='GRD';


                                            COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM gerados.barang WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='GRY' then
                                      BEGIN
                                      MERK:='BRY';


                                            COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM gerry.barang WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='GSH' then
                                      BEGIN
                                       MERK:='GSH';


                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM gosh.barang WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='JOP' then
                                      BEGIN
                                       MERK:='JOP';


                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM joop.barang WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='RTL' then
                                      BEGIN

                                       MERK:='RTL';


                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM rotelli.barang WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;


                                      END
                                      ELSE IF herox.FieldByName('kodem').AsString='TRS' then
                                      BEGIN

                                       MERK:='TRS';


                                       COMD.SQL.Clear;
                                       COMD.SQL.Text:='SELECT * FROM torresin.barang WHERE ARTIKEL=:KD_BRG ORDER BY ARTIKEL  ';
                                       COMD.Params.ParamByName('KD_BRG').Value := trim(com.FieldByName('KD_BRG').value) ;
                                       COMD.Open;

                                      END;




                                   HERO.SQL.Clear;
                                   HERO.SQL.Text:='CALL CEKBRG( :KD_BRG,:SATUAN,:SIZ ,:KODECAB,:KD,:PRODUK,:WARNA,:YER,:BRAND)';
                                   HERO.Params.ParamByName('KD_BRG').Value := trim(comd.FieldByName('ARTIKEL').value) ;
                                   HERO.Params.ParamByName('SATUAN').Value := trim(comd.FieldByName('SATUAN').value) ;
                                   HERO.Params.ParamByName('SIZ').Value :=0;
                                   HERO.Params.ParamByName('BRAND').Value :=MERK;
                                   HERO.Params.ParamByName('KODECAB').Value := trim(com.FieldByName('KODECAB').value) ;
                                   HERO.Params.ParamByName('KD').Value := trim(com.FieldByName('KD').asstring) ;
                                   HERO.Params.ParamByName('PRODUK').Value := trim(comd.FieldByName('PRODUK').value) ;
                                   HERO.Params.ParamByName('WARNA').Value := trim(comd.FieldByName('WARNA').value) ;
                                   HERO.Params.ParamByName('YER').Value :=com.FieldByName('yer').value ;
                                   HERO.ExecSQL;



                   end;







                COM.Next;
                END;










                        HERO.sql.clear;
                        HERO.sql.text:=' INSERT INTO PO(NO_BUKTI,KODES,NAMAS,TGL,JTEMPO,CURR,RATE,'
                                      +'  FLAG,PER,TYP,GOL,BRAND ) VALUES ( '
                                      +'  :NO_BUKTI,:KODES,:NAMAS,:TGL,:JTEMPO,:CURR,:RATE,:FLAG,:PER,:TYP,:GOL,:BRAND)';
                        HERO.Params.ParamByName('NO_BUKTI').Value:=TRIM(COM.FieldByName('NO_BUKTI').value);
                        HERO.Params.ParamByName('KODES').Value:=KODESX;
                        HERO.Params.ParamByName('NAMAS').Value:=NAMASX;
                        HERO.Params.ParamByName('TGL').Value:=FormatDateTime('yyyy-mm-dd',COM.FieldByName('TGL').AsDateTime);
                        HERO.Params.ParamByName('JTEMPO').Value:=FormatDateTime('yyyy-mm-dd',COM.FieldByName('JTEMPO').AsDateTime);
                        HERO.Params.ParamByName('CURR').Value:=TRIM(COM.FieldByName('CURR').value);
                        HERO.Params.ParamByName('RATE').Value:=COM.FieldByName('RATE').value;
                        HERO.Params.ParamByName('FLAG').Value:=TRIM(COM.FieldByName('FLAG').value);
                        HERO.Params.ParamByName('PER').Value:=TRIM(COM.FieldByName('PER').value);
                        HERO.Params.ParamByName('TYP').Value:=TRIM(COM.FieldByName('TYP').value);
                        HERO.Params.ParamByName('GOL').Value:=TRIM(COM.FieldByName('GOL').value);
                        HERO.Params.ParamByName('BRAND').Value:=MERK;
                        HERO.ExecSQL;



                        HERO.SQL.Clear;
                        HERO.SQL.TEXT:=' UPDATE PO,(SELECT NO_BUKTI,SUM(QTY) AS TOTAL_QTY,SUM(TOTAL1) AS TOTAL1,SUM(TOTAL) AS TOTAL FROM POD WHERE NO_BUKTI=:NO_BUKTI  GROUP BY NO_BUKTI ) AS  HERO SET  '
                                      +' PO.TOTAL_QTY=HERO.TOTAL_QTY,PO.SISA_QTY=PO.TOTAL_QTY,PO.TOTAL=HERO.TOTAL,PO.NETT = HERO.TOTAL,PO.TOTAL1=HERO.TOTAL1,PO.NETT1=HERO.TOTAL1 WHERE PO.NO_BUKTI=HERO.NO_BUKTI ';
                        HERO.Params.ParamByName('NO_BUKTI').Value:=TRIM(COM.FieldByName('NO_BUKTI').value);
                        HERO.ExecSQL;





               hero.SQL.Clear;
               hero.SQL.text:='update POD,PO set POD.ID=PO.NO_ID WHERE TRIM(POD.NO_BUKTI)=TRIM(PO.NO_BUKTI) AND trim(POD.NO_BUKTI)=:NO_BUKTI  ' ;
               hero.Params.ParamByName('no_bukti').Value:=TRIM(COM.FieldByName('no_bukti').asstring);
               hero.ExecSQL;


               hero.SQL.Clear;
               hero.SQL.text:='update POD,( select no_bukti,no_id,if(@bukti=no_bukti,@rec:=@rec+1,@rec:=1) as rec,@bukti:=no_bukti from POD join ( select @bukti:='''',@rec:=0 ) as uu on 1=1 where no_bukti=:BUKTI ORDER BY NO_BUKTI,NO_ID ) as hero '
                             +' set POD.REC=HERO.REC WHERE TRIM(POD.NO_ID)=TRIM(HERO.NO_ID)  ' ;
               hero.Params.ParamByName('bukti').Value:=TRIM(COM.FieldByName('no_bukti').asstring);
               hero.ExecSQL;


               hero.SQL.Clear;
               hero.SQL.text:='update POD,BRG set POD.SATUAN=BRG.SATUAN,POD.WARNA=BRG.WARNA WHERE TRIM(POD.NO_BUKTI)=:BUKTI AND POD.KD_BRG=BRG.KD_BRG ' ;
               hero.Params.ParamByName('bukti').Value:=TRIM(COM.FieldByName('no_bukti').asstring);
               hero.ExecSQL;



             /// ##########################  PEMBELIAN BARANG #############################################

                     // ShowMessage('2');



            if herox.FieldByName('kodem').AsString='BLG' then
              BEGIN
                 MERK:='BLG';


              comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO , BPBARTIKEL AS KD_BRG, BPBHARGA AS HARGA,BPBQTY AS QTY ,BPBSIZE AS SIZ,IF(BPBKODE=''P'',''9'',''0'') AS KD,'
                            + ' BPBPRODUK AS PRODUK FROM bellagio.rabpb WHERE  BPBNOPO =:NO_PO ORDER BY BPBBUKTI   ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;




              END
              ELSE IF herox.FieldByName('kodem').AsString='BRN' then
              BEGIN

                 MERK:='BRN';


                comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO , BPBARTIKEL AS KD_BRG, BPBHARGA AS HARGA,BPBQTY AS QTY ,BPBSIZE AS SIZ,IF(BPBKODE=''P'',''9'',''0'') AS KD,'
                            + ' BPBPRODUK AS PRODUK FROM brunopremi.rabpb WHERE  BPBNOPO =:NO_PO ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;



              END
              ELSE IF herox.FieldByName('kodem').AsString='ELV' then
              BEGIN


               MERK:='ELV';

             comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO , BPBARTIKEL AS KD_BRG, BPBHARGA AS HARGA,BPBQTY AS QTY ,BPBSIZE AS SIZ,IF(BPBKODE=''P'',''9'',''0'') AS KD,'
                            + ' BPBPRODUK AS PRODUK FROM elvio.rabpb WHERE  BPBNOPO =:NO_PO ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;





                 END
                ELSE IF herox.FieldByName('kodem').AsString='GRD' then
                BEGIN

                 MERK:='GRD';


               comd.SQL.Clear;
               comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO , BPBARTIKEL AS KD_BRG, BPBHARGA AS HARGA,BPBQTY AS QTY ,BPBSIZE AS SIZ,IF(BPBKODE=''P'',''9'',''0'') AS KD,'
                            + ' BPBPRODUK AS PRODUK FROM gerados.rabpb WHERE  BPBNOPO =:NO_PO ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;





                END
                ELSE IF herox.FieldByName('kodem').AsString='GRY' then
                BEGIN
                MERK:='BRY';

                comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO , BPBARTIKEL AS KD_BRG, BPBHARGA AS HARGA,BPBQTY AS QTY ,BPBSIZE AS SIZ,IF(BPBKODE=''P'',''9'',''0'') AS KD,'
                            + ' BPBPRODUK AS PRODUK FROM gerry.rabpb WHERE  BPBNOPO =:NO_PO ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;





                END
                ELSE IF herox.FieldByName('kodem').AsString='GSH' then
                BEGIN
                 MERK:='GSH';


                 comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO , BPBARTIKEL AS KD_BRG, BPBHARGA AS HARGA,BPBQTY AS QTY ,BPBSIZE AS SIZ,IF(BPBKODE=''P'',''9'',''0'') AS KD,'
                            + ' BPBPRODUK AS PRODUK FROM gosh.rabpb WHERE  BPBNOPO =:NO_PO ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;

                END
                ELSE IF herox.FieldByName('kodem').AsString='JOP' then
                BEGIN
                 MERK:='JOP';


                  comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO , BPBARTIKEL AS KD_BRG, BPBHARGA AS HARGA,BPBQTY AS QTY ,BPBSIZE AS SIZ,IF(BPBKODE=''P'',''9'',''0'') AS KD,'
                            + ' BPBPRODUK AS PRODUK FROM joop.rabpb WHERE  BPBNOPO =:NO_PO ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;

                END
                ELSE IF herox.FieldByName('kodem').AsString='RTL' then
                BEGIN

                 MERK:='RTL';

              comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO , BPBARTIKEL AS KD_BRG, BPBHARGA AS HARGA,BPBQTY AS QTY ,BPBSIZE AS SIZ,IF(BPBKODE=''P'',''9'',''0'') AS KD,'
                            + ' BPBPRODUK AS PRODUK FROM rotelli.rabpb WHERE  BPBNOPO =:NO_PO ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;

                END
                ELSE IF herox.FieldByName('kodem').AsString='TRS' then
                BEGIN

                 MERK:='TRS';

                     comd.SQL.Clear;
                  comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO , BPBARTIKEL AS KD_BRG, BPBHARGA AS HARGA,BPBQTY AS QTY ,BPBSIZE AS SIZ,IF(BPBKODE=''P'',''9'',''0'') AS KD,'
                                + ' BPBPRODUK AS PRODUK FROM torresin.rabpb WHERE  BPBNOPO =:NO_PO ORDER BY BPBBUKTI ';
                  comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
                  comd.open;

                END;





          if comd.RecordCount > 0 then
          begin


              comd.First;

              while not comd.eof do
              begin


                       BLX:=1;

                    hero.SQL.Clear;
                    hero.SQL.text:='insert into belid(no_bukti,no_po,kd_brg,qty,qtybl,harga,siz,kd,produk,kodecab) values ( '
                                  +' :no_bukti,:no_po,:kd_brg,:qty,:qty,:harga,:siz,:kd,:produk,:kodecab ) ';
                    hero.Params.ParamByName('no_bukti').Value:=MERK+'-'+TRIM(comd.FieldByName('no_bukti').asstring);
                    hero.Params.ParamByName('no_po').Value:=TRIM(comd.FieldByName('no_po').asstring);
                    hero.Params.ParamByName('kd_brg').Value:=TRIM(comd.FieldByName('kd_brg').asstring);
                    hero.Params.ParamByName('qty').Value:=comd.FieldByName('qty').value;
                    hero.Params.ParamByName('harga').Value:=comd.FieldByName('harga').value;
                    hero.Params.ParamByName('siz').Value:=comd.FieldByName('siz').value;
                    hero.Params.ParamByName('kd').Value:=TRIM(comd.FieldByName('kd').asstring);
                    hero.Params.ParamByName('produk').Value:=TRIM(comd.FieldByName('produk').asstring);
                    hero.Params.ParamByName('kodecab').Value:=TRIM(comd.FieldByName('kodecab').asstring);
                    hero.ExecSQL;




              comd.Next;
              end;


               //   ShowMessage('3');

               if herox.FieldByName('kodem').AsString='BLG' then
              BEGIN
                 MERK:='BLG';


             comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,CONCAT(LPAD(MONTH(BPBTGL),2,''0''),''/'',YEAR(BPBTGL)) AS PER,YEAR(BPBTGL) as yer,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO ,'
                            +' SUM(BPBQTY )AS TOTAL_QTY ,IF(BPBKODE=''P'',''9'',''0'') AS KD '
                            + ' FROM bellagio.rabpb WHERE BPBNOPO =:NO_PO GROUP BY BPBBUKTI ORDER BY BPBBUKTI';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;



              END
              ELSE IF herox.FieldByName('kodem').AsString='BRN' then
              BEGIN

                 MERK:='BRN';


                 comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,CONCAT(LPAD(MONTH(BPBTGL),2,''0''),''/'',YEAR(BPBTGL)) AS PER,YEAR(BPBTGL) as yer,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO ,'
                            +' SUM(BPBQTY )AS TOTAL_QTY ,IF(BPBKODE=''P'',''9'',''0'') AS KD '
                            + ' FROM brunopremi.rabpb WHERE BPBNOPO =:NO_PO GROUP BY BPBBUKTI  ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;



              END
              ELSE IF herox.FieldByName('kodem').AsString='ELV' then
              BEGIN


               MERK:='ELV';

              comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,CONCAT(LPAD(MONTH(BPBTGL),2,''0''),''/'',YEAR(BPBTGL)) AS PER,YEAR(BPBTGL) as yer,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO ,'
                            +' SUM(BPBQTY )AS TOTAL_QTY ,IF(BPBKODE=''P'',''9'',''0'') AS KD '
                            + ' FROM elvio.rabpb WHERE BPBNOPO =:NO_PO GROUP BY BPBBUKTI  ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;





                 END
                ELSE IF herox.FieldByName('kodem').AsString='GRD' then
                BEGIN

                 MERK:='GRD';


              comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,CONCAT(LPAD(MONTH(BPBTGL),2,''0''),''/'',YEAR(BPBTGL)) AS PER,YEAR(BPBTGL) as yer,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO ,'
                            +' SUM(BPBQTY )AS TOTAL_QTY ,IF(BPBKODE=''P'',''9'',''0'') AS KD '
                            + ' FROM gerados.rabpb WHERE BPBNOPO =:NO_PO GROUP BY BPBBUKTI  ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;




                END
                ELSE IF herox.FieldByName('kodem').AsString='GRY' then
                BEGIN
                MERK:='BRY';


              comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,CONCAT(LPAD(MONTH(BPBTGL),2,''0''),''/'',YEAR(BPBTGL)) AS PER,YEAR(BPBTGL) as yer,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO ,'
                            +' SUM(BPBQTY )AS TOTAL_QTY ,IF(BPBKODE=''P'',''9'',''0'') AS KD '
                            + ' FROM gerry.rabpb WHERE BPBNOPO =:NO_PO GROUP BY BPBBUKTI  ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;




                END
                ELSE IF herox.FieldByName('kodem').AsString='GSH' then
                BEGIN
                 MERK:='GSH';

               comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,CONCAT(LPAD(MONTH(BPBTGL),2,''0''),''/'',YEAR(BPBTGL)) AS PER,YEAR(BPBTGL) as yer,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO ,'
                            +' SUM(BPBQTY )AS TOTAL_QTY ,IF(BPBKODE=''P'',''9'',''0'') AS KD '
                            + ' FROM gosh.rabpb WHERE BPBNOPO =:NO_PO GROUP BY BPBBUKTI  ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;

                END
                ELSE IF herox.FieldByName('kodem').AsString='JOP' then
                BEGIN
                 MERK:='JOP';


               comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,CONCAT(LPAD(MONTH(BPBTGL),2,''0''),''/'',YEAR(BPBTGL)) AS PER,YEAR(BPBTGL) as yer,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO ,'
                            +' SUM(BPBQTY )AS TOTAL_QTY ,IF(BPBKODE=''P'',''9'',''0'') AS KD '
                            + ' FROM joop.rabpb WHERE BPBNOPO =:NO_PO GROUP BY BPBBUKTI  ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;

                END
                ELSE IF herox.FieldByName('kodem').AsString='RTL' then
                BEGIN

                 MERK:='RTL';

              comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,CONCAT(LPAD(MONTH(BPBTGL),2,''0''),''/'',YEAR(BPBTGL)) AS PER,YEAR(BPBTGL) as yer,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO ,'
                            +' SUM(BPBQTY )AS TOTAL_QTY ,IF(BPBKODE=''P'',''9'',''0'') AS KD  '
                            + ' FROM rotelli.rabpb WHERE BPBNOPO =:NO_PO GROUP BY BPBBUKTI  ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;

                END
                ELSE IF herox.FieldByName('kodem').AsString='TRS' then
                BEGIN

                 MERK:='TRS';

                    comd.SQL.Clear;
              comd.SQL.Text:='SELECT BPBBUKTI AS NO_BUKTI,BPBTGL AS TGL,CONCAT(LPAD(MONTH(BPBTGL),2,''0''),''/'',YEAR(BPBTGL)) AS PER,YEAR(BPBTGL) as yer,BPBSUPP AS KODES,BPBCAB AS KODECAB,BPBNOSJ AS NO_SJ,BPBTGLSJ AS TGL_SJ,BPBNOPO AS NO_PO ,'
                            +' SUM(BPBQTY )AS TOTAL_QTY ,IF(BPBKODE=''P'',''9'',''0'') AS KD '
                            + ' FROM torresin.rabpb WHERE BPBNOPO =:NO_PO GROUP BY BPBBUKTI  ORDER BY BPBBUKTI ';
              comd.Params.ParamByName('no_po').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
              comd.open;

                END;



            if comd.RecordCount > 0 then
            begin

              comd.First;

              while not comd.eof do
              begin
                          hero.SQL.Clear;
                          hero.sql.text:=' INSERT INTO BELI ( NO_BUKTI,TGL,KODES,NAMAS,NO_SJ,TGL_SJ,TOTAL_QTY,FLAG,NO_PO,per,BRAND ) VALUES ( '
                                        +'  :NO_BUKTI,:TGL,:KODES,:NAMAS,:NO_SJ,:TGL_SJ,:TOTAL_QTY,''BL'',:NO_PO,:per,:BRAND )';
                          hero.Params.ParamByName('no_bukti').Value:=MERK+'-'+TRIM(comd.FieldByName('no_bukti').asstring);
                          hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',COMD.FieldByName('TGL').AsDateTime);
                          hero.Params.ParamByName('kodes').Value:=KODESX;
                          hero.Params.ParamByName('namas').Value:=NAMASX;
                          hero.Params.ParamByName('no_sj').Value:=TRIM(comd.FieldByName('no_sj').asstring);
                          hero.Params.ParamByName('tgl_sj').Value:=comd.FieldByName('tgl_sj').AsDateTime;
                          hero.Params.ParamByName('total_qty').Value:=comd.FieldByName('total_qty').value;
                          hero.Params.ParamByName('no_PO').Value:=TRIM(comd.FieldByName('no_PO').asstring);
                          hero.Params.ParamByName('per').Value:=TRIM(comd.FieldByName('per').asstring);
                          HERO.Params.ParamByName('BRAND').Value:=MERK;
                          hero.ExecSQL;


                comd.Next;
              end;

            end;

                       //  ShowMessage('5');
               hero.SQL.Clear;
               hero.sql.text:=' UPDATE BELI,PO SET BELI.CURR=PO.CURR,BELI.CURRNM=PO.CURRNM,BELI.RATE=PO.RATE,BELI.TYP=PO.TYP ,BELI.GOL=PO.GOL WHERE BELI.NO_PO=PO.NO_BUKTI AND BELI.NO_PO=:NO_PO ';
               hero.Params.ParamByName('no_PO').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
               hero.ExecSQL;

               hero.SQL.Clear;
               hero.sql.text:=' UPDATE BELID,POD SET BELID.HARGA1=POD.HARGA1 , BELID.HARGA=POD.HARGA WHERE BELID.NO_PO=POD.NO_BUKTI AND BELID.KD_BRG=POD.KD_BRG AND BELID.SIZ=POD.SIZ AND BELID.NO_PO=:NO_PO ';
               hero.Params.ParamByName('no_PO').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
               hero.ExecSQL;

               hero.SQL.Clear;
               hero.sql.text:=' UPDATE BELID,BELI SET BELID.ID=BELI.NO_ID ,BELID.TOTAL = BELID.QTY * BELID.HARGA,BELID.TOTAL1 = BELID.QTY * BELID.HARGA1,'
                            +'  BELID.TYP=BELI.TYP ,BELID.GOL=BELI.GOL,BELID.PER=BELI.PER,BELID.FLAG=BELI.FLAG WHERE BELID.NO_BUKTI=BELI.NO_BUKTI AND BELID.NO_PO=:NO_PO ';
               hero.Params.ParamByName('no_PO').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
               hero.ExecSQL;



            hero.SQL.Clear;
            hero.SQL.text:='update BELID,( select no_bukti,no_id,if(@bukti=no_bukti,@rec:=@rec+1,@rec:=1) as rec,@bukti:=no_bukti from BELId join ( select @bukti:='''',@rec:=0 ) as uu on 1=1 '
                         +' where NO_PO=:no_po  ORDER BY NO_BUKTI,NO_ID ) as hero  set BELID.REC=HERO.REC WHERE TRIM(BELID.NO_ID)=TRIM(HERO.NO_ID)  ' ;
            hero.Params.ParamByName('no_PO').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
            hero.ExecSQL;




                hero.SQL.Clear;
                hero.SQL.text:='UPDATE BELI,(SELECT BELID.no_bukti , SUM(BELID.qty) AS TOTAL_QTY,SUM(BELID.TOTAL) AS TOTAL,SUM(BELID.TOTAL1) AS TOTAL1 FROM BELID WHERE  TRIM(BELID.NO_PO)=:NO_PO GROUP BY BELID.NO_BUKTI) AS BL '
                                   +' SET BELI.total_qty = BL.TOTAL_QTY, BELI.total = BL.TOTAL,BELI.NETT = BL.TOTAL,BELI.SISA = BL.TOTAL1, BELI.total1 = BL.TOTAL1,BELI.NETT1 = BL.TOTAL1 WHERE TRIM(BELI.no_bukti) = TRIM(BL.no_bukti) ';
                hero.Params.ParamByName('no_PO').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
                hero.ExecSQL;


               hero.SQL.Clear;
               hero.SQL.text:='update BELID,BRG set BELID.SATUAN=BRG.SATUAN,belid.satuanbl=brg.satuan,BELID.WARNA=BRG.WARNA WHERE TRIM(BELID.NO_PO)=:NO_PO AND BELID.KD_BRG=BRG.KD_BRG ' ;
               hero.Params.ParamByName('no_PO').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
               hero.ExecSQL;



                herod.SQL.Clear;
                herod.sql.text:='SELECT NO_BUKTI FROM BELI WHERE NO_PO = :NO_PO ';
                herod.Params.ParamByName('no_PO').Value:=TRIM(herox.FieldByName('no_bukti').asstring);
                herod.open;

                herod.First;


                while not herod.eof do
                begin

                  hero.SQL.Clear;
                  hero.SQL.Text:='CALL BELIINS(:NO_BUKTI)';
                  hero.Params.ParamByName('NO_BUKTI').Value:=TRIM(herod.FieldByName('no_bukti').asstring);
                  hero.ExecSQL;

                herod.Next;
                end;

            end;


           end;

    end;
        HERO.SQL.Clear;
        HERO.SQL.text:='UPDATE IMPORTDATA SET POSTED=1,POZ=:POZ,BELIZ=:BLZ,STATUS=:STATUS where NO_ID=:ID ';
        HERO.Params.ParamByName('ID').Value:=HEROX.FieldByName('NO_ID').value;
        HERO.Params.ParamByName('POZ').Value:=POX;
        HERO.Params.ParamByName('BLZ').Value:=BLX;
        HERO.Params.ParamByName('STATUS').Value:=STATUS;
        HERO.ExecSQL;

  herox.next
  END;

end;


procedure TFRRETAIL.pembelian;
var
BUKTIPO,BUKTIBL,STATUS,MERK,TYPX,KODESX,NAMASX : STRING;
POX,BLX,I,cek,IDX : INTEGER;
siz,QTYZ : real;

begin

  HEROX.SQL.Clear;
  HEROX.SQL.text:='SELECT * from IMPORTDATA where tgl=date(now()) and POSTED=0 and proses=1 and cek=1 and TYP="R" and kodem="PO" ';
  HEROX.OPEN;

  HEROX.First;
  while NOT HEROX.EOF do
  BEGIN

    hero.Close;
    hero.SQL.Clear;
    hero.SQL.Text := 'select no_bukti from po where no_bukti=:bukti';
    hero.Params.ParamByName('bukti').Value := herox.FieldByName('no_bukti').AsString;
    hero.Open;

    if hero.RecordCount=0 then
    begin
      com.Close;
      com.SQL.Clear;
      com.SQL.Text := 'select headpo_t.*,CONCAT(LEFT(RIGHT((headpo_t.TGL_PO),5),2),"/",LEFT((headpo_t.TGL_PO),4)) as per from eis.headpo_t where headpo_t.NO_PO=:BUKTI ';
      com.Params.ParamByName('bukti').Value := herox.FieldByName('no_bukti').AsString;
      com.Open;

      if com.RecordCount > 0 then
      begin

        hero.Close;
        hero.SQL.Clear;
        hero.SQL.Text := ' INSERT INTO PO(NO_BUKTI,KODES,NAMAS,TGL,JTEMPO,CURR,RATE,'
                        +' FLAG,PER,TYP,GOL,BRAND ) VALUES ( '
                        +' :NO_BUKTI,:KODES,:NAMAS,:TGL,:JTEMPO,:CURR,:RATE,"PN",:PER,"","","")';
        hero.Params.ParamByName('NO_BUKTI').Value  :=TRIM(COM.FieldByName('NO_PO').value);
        hero.Params.ParamByName('KODES').Value     :=TRIM(HEROX.FieldByName('KODES').value);
        hero.Params.ParamByName('NAMAS').Value     :=TRIM(HEROX.FieldByName('NAMAS').value);
        hero.Params.ParamByName('TGL').Value       :=FormatDateTime('yyyy-mm-dd',COM.FieldByName('TGL_PO').AsDateTime);
        hero.Params.ParamByName('JTEMPO').Value    :=FormatDateTime('yyyy-mm-dd',COM.FieldByName('TGL_PAYMEN').AsDateTime);
        hero.Params.ParamByName('CURR').Value      :='IDR';
        hero.Params.ParamByName('RATE').Value      := 1;
        hero.Params.ParamByName('PER').Value       :=TRIM(COM.FieldByName('PER').value);
        hero.Execute;

        comd.Close;
        comd.SQL.Clear;
        comd.SQL.Text := 'select detpo_t.* from eis.detpo_t where detpo_t.NO_PO=:BUKTI ';
        comd.Params.ParamByName('bukti').Value := herox.FieldByName('no_bukti').AsString;
        comd.Open;

        if comd.RecordCount > 0 then
        begin

        comd.First;
          while not comd.eof do
          begin

            herod.Close;
            herod.SQL.Clear;
            herod.SQL.Text := ' INSERT INTO POD ( NO_BUKTI,KD_BHN,QTY,SISA_QTY,SISAF,HARGA, TOTAL, HARGA1, TOTAL1,PER,FLAG,KET,POTGL,NO_PP ) VALUES '+
                              ' (:NO_BUKTI,".",:QTY,:QTY,:QTY,:HARGA,:total,:HARGA,:TOTAL,:PER,"PN",:KET,:POTGL,:NO_PP ) ';
            herod.Params.ParamByName('NO_BUKTI').Value  :=TRIM(comd.FieldByName('NO_PO').AsString);
            herod.Params.ParamByName('QTY').Value       :=comd.FieldByName('QTY').AsFloat;
            herod.Params.ParamByName('HARGA').Value     :=comd.FieldByName('PRICE').AsFloat;
            herod.Params.ParamByName('TOTAL').Value     :=comd.FieldByName('AMOUNT').AsFloat;
            herod.Params.ParamByName('PER').Value       :=TRIM(COM.FieldByName('PER').AsString);
            herod.Params.ParamByName('KET').Value       :=TRIM(comd.FieldByName('SPECS').AsString);
            herod.Params.ParamByName('POTGL').Value     :=FormatDateTime('yyyy-mm-dd',COM.FieldByName('TGL_PO').AsDateTime);
            herod.Params.ParamByName('NO_PP').Value     :=TRIM(com.FieldByName('NO_PP').value);
            herod.Execute;

          comd.Next;
          end;

        end;

        HERO.SQL.Clear;
        HERO.SQL.TEXT:=' UPDATE PO,(SELECT NO_BUKTI,SUM(QTY) AS TOTAL_QTY,SUM(TOTAL1) AS TOTAL1,SUM(TOTAL) AS TOTAL FROM POD WHERE NO_BUKTI=:NO_BUKTI  GROUP BY NO_BUKTI ) AS  HERO SET  '
                      +' PO.TOTAL_QTY=HERO.TOTAL_QTY,PO.SISA_QTY=HERO.TOTAL_QTY,PO.TOTAL=HERO.TOTAL,PO.NETT = HERO.TOTAL,PO.TOTAL1=HERO.TOTAL1,PO.NETT1=HERO.TOTAL1,PO.SISA=HERO.TOTAL1 WHERE PO.NO_BUKTI=HERO.NO_BUKTI ';
        HERO.Params.ParamByName('NO_BUKTI').Value:=TRIM(COM.FieldByName('NO_PO').value);
        HERO.ExecSQL;

        hero.SQL.Clear;
        hero.SQL.text:='update POD,PO set POD.ID=PO.NO_ID WHERE TRIM(POD.NO_BUKTI)=TRIM(PO.NO_BUKTI) AND trim(POD.NO_BUKTI)=:NO_BUKTI  ' ;
        hero.Params.ParamByName('no_bukti').Value:=TRIM(COM.FieldByName('NO_PO').asstring);
        hero.ExecSQL;


        hero.SQL.Clear;
        hero.SQL.text:='update POD,( select no_bukti,no_id,if(@bukti=no_bukti,@rec:=@rec+1,@rec:=1) as rec,@bukti:=no_bukti from POD join ( select @bukti:='''',@rec:=0 ) as uu on 1=1 where no_bukti=:BUKTI ORDER BY NO_BUKTI,NO_ID ) as hero '
             +' set POD.REC=HERO.REC WHERE TRIM(POD.NO_ID)=TRIM(HERO.NO_ID)  ' ;
        hero.Params.ParamByName('bukti').Value:=TRIM(COM.FieldByName('NO_PO').asstring);
        hero.ExecSQL;


        hero.SQL.Clear;
        hero.SQL.text:='update POD,BRG set POD.SATUAN=BRG.SATUAN,POD.WARNA=BRG.WARNA WHERE TRIM(POD.NO_BUKTI)=:BUKTI AND POD.KD_BRG=BRG.KD_BRG ' ;
        hero.Params.ParamByName('bukti').Value:=TRIM(COM.FieldByName('NO_PO').asstring);
        hero.ExecSQL;


      end;

      HERO.SQL.Clear;
      HERO.SQL.text:='UPDATE IMPORTDATA SET POSTED=1,POZ=:POZ,BELIZ=:BLZ,STATUS=:STATUS where NO_ID=:ID ';
      HERO.Params.ParamByName('ID').Value:=HEROX.FieldByName('NO_ID').value;
      HERO.Params.ParamByName('POZ').Value:= 1 ;
      HERO.Params.ParamByName('BLZ').Value:= 0 ;
      HERO.Params.ParamByName('STATUS').Value:='Berhasil';
      HERO.ExecSQL;

    end
    else
    begin
      HERO.SQL.Clear;
      HERO.SQL.text:='UPDATE IMPORTDATA SET POSTED=1,POZ=:POZ,BELIZ=:BLZ,STATUS=:STATUS where NO_ID=:ID ';
      HERO.Params.ParamByName('ID').Value:=HEROX.FieldByName('NO_ID').value;
      HERO.Params.ParamByName('POZ').Value:= 0 ;
      HERO.Params.ParamByName('BLZ').Value:= 0 ;
      HERO.Params.ParamByName('STATUS').Value:='Gagal';
      HERO.ExecSQL;
    end;

  HEROX.Next;
  END;

end;

end.

