unit Shadow;

interface

uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
     Ttipoacao = (sbCrt,sbUp,sbFree);
     TShadowForm = class(TForm)
     private
       { Private declarations }
       FBmp: TBitmap;
       FTextOut: string;
       procedure FillControlRect(Control: TControl);
       procedure FillControlRects(Control: TWinControl);
       procedure AvisoDescricao(vTexto: string);


     protected
       procedure Paint; override;
       procedure WMMouseActivate(var Message: TWMMouseActivate); message WM_MOUSEACTIVATE;
       procedure WMDisplayChange(var Message: TMessage); message WM_DISPLAYCHANGE;
     public
       { Public declarations }
       constructor CreateShadow(AForm: TForm);
       destructor Destroy; override;
       procedure UpdateShadowtext(vTexto:string='');
       procedure UpdateShadow;

     end;

implementation

{$R *.dfm}



constructor TShadowForm.CreateShadow(AForm: TForm);
begin
     inherited Create(AForm);
     PopupParent := AForm;
     FBmp := TBitmap.Create;
     FBmp.PixelFormat := pf24bit;

end;

destructor TShadowForm.Destroy;
begin
     FBmp.Free;
     inherited;
end;

procedure TShadowForm.Paint;
begin
     Canvas.Draw(0, 0, FBmp);
end;

procedure TShadowForm.FillControlRect(Control: TControl);
var
  I: Integer;
  R: TRect;
begin
  if Control.Tag = 1 then
  begin
    R := Control.BoundsRect;
    MapWindowPoints(Control.Parent.Handle, PopupParent.Handle, R, 2);
    FBmp.Canvas.FillRect(R);
  end;
  if Control is TWinControl then
    FillControlRects(TWinControl(Control));
end;

procedure TShadowForm.FillControlRects(Control: TWinControl);
var
  I: Integer;
begin
  for I := 0 to Control.ControlCount-1 do
    FillControlRect(Control.Controls[I]);
end;

procedure TShadowForm.AvisoDescricao(vTexto:string);
var
  ww: Integer;
  hh: Integer;
begin
  hh := 0;
  ww := 0;
  ww:=Canvas.TextWidth(FTextOut);
  hh:=Canvas.TextHeight(FTextOut);
  FBmp.Canvas.Font.Name  := 'Arial';
  FBmp.Canvas.Font.Size  := 15;
  FBmp.Canvas.Font.Style := [];
  FBmp.Canvas.Font.Color := clBlue;
  FBmp.Canvas.Brush.Style:=bsClear;
  FBmp.Canvas.TextOut((Width-ww) div 2, (Height-50),vTexto);
end;

procedure TShadowForm.UpdateShadow;
var
  Pt: TPoint;
  R: TRect;
begin
  Pt := PopupParent.ClientOrigin;
  R := PopupParent.ClientRect;

  FBmp.Width := R.Right - R.Left;
  FBmp.Height := R.Bottom - R.Top;

  FBmp.Canvas.Brush.Color := clSkyBlue;
  FBmp.Canvas.FillRect(Rect(0, 0, FBmp.Width, FBmp.Height));

  FBmp.Canvas.Brush.Color := TransparentColorValue;
  FillControlRects(PopupParent);

  SetBounds(Pt.X, Pt.Y, FBmp.Width, FBmp.Height);
  if Showing then
    Invalidate
  else
    ShowWindow(Handle, SW_SHOWNOACTIVATE);
end;


procedure TShadowForm.UpdateShadowtext(vTexto:string='');
var
     Pt: TPoint;
     R: TRect;
  ww: Integer;
  hh: Integer;
begin
  hh := 0;
  ww := 0;
  Pt := PopupParent.ClientOrigin;
  R := PopupParent.ClientRect;

  FBmp.Width := R.Right - R.Left;
  FBmp.Height := R.Bottom - R.Top;
  FBmp.Canvas.Brush.Color := clGray;
  FBmp.Canvas.FillRect(Rect(0, 0, FBmp.Width, FBmp.Height));
  FBmp.Canvas.Brush.Color := TransparentColorValue;
  {
  if FTextOut <> '' then
  begin
    ww:=Canvas.TextWidth(FTextOut);
    hh:=Canvas.TextHeight(FTextOut);
    FBmp.Canvas.Font.Name  := 'Arial';
    FBmp.Canvas.Font.Size  := 20;
    FBmp.Canvas.Font.Style := [fsBold];
    FBmp.Canvas.Font.Color := clWhite;
    FBmp.Canvas.Brush.Style:=bsClear;
    FBmp.Canvas.TextOut((Width-ww) div 2, (Height-hh) div 2,FTextOut);
  end;
  if vTexto <> '' then
    AvisoDescricao(vTexto);
    }
  FillControlRects(PopupParent);

  SetBounds(Pt.X, Pt.Y, FBmp.Width, FBmp.Height);
  if Showing then
    Invalidate
  else
    ShowWindow(Handle, SW_SHOWNOACTIVATE);
end;

procedure TShadowForm.WMDisplayChange(var Message: TMessage);
begin
     inherited;
     UpdateShadow;
end;

procedure TShadowForm.WMMouseActivate(var Message: TWMMouseActivate);
begin
     Message.Result := MA_NOACTIVATE;
end;

end.