program fiture_satuan1;

uses
  Forms,
  fiture_satuan in 'fiture_satuan.pas' {satuan};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tsatuan, satuan);
  Application.Run;
end.
