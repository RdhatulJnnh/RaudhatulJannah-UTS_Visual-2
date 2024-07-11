unit fiture_satuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  Tsatuan = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    dbgrd1: TDBGrid;
    Label4: TLabel;
    edt3: TEdit;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    edt4: TEdit;
    edt5: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  satuan: Tsatuan;

implementation

{$R *.dfm}

procedure Tsatuan.btn1Click(Sender: TObject);
begin
with zqry1 do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO satuan (nama, deskripsi)');
    SQL.Add('VALUES (:nama, :deskripsi)');
    ParamByName('nama').AsString := edt1.Text;
    ParamByName('deskripsi').AsString := edt2.Text;
    ExecSQL;
    SQL.Text := 'SELECT * FROM satuan';
    Open;
  end;
  edt1.Clear;
  edt2.Clear;
end;

procedure Tsatuan.btn2Click(Sender: TObject);
begin
 with zqry1 do
  begin
    SQL.Clear;
    SQL.Add('UPDATE satuan SET nama = :nama, deskripsi = :deskripsi WHERE id = :id');
    ParamByName('nama').AsString := edt1.Text;
    ParamByName('deskripsi').AsString := edt2.Text;
    ParamByName('id').AsInteger := StrToInt(edt3.Text);
    SQL.Text := 'SELECT * FROM satuan';
    Open;
  end;
end;

procedure Tsatuan.btn3Click(Sender: TObject);
begin
zqry1.Delete;
end;

procedure Tsatuan.btn4Click(Sender: TObject);
begin
edt1.Clear;
edt2.Clear;
end;

end.
