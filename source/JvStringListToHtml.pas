{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvStringListToHtml.PAS, released on 2001-02-28.

The Initial Developer of the Original Code is Sébastien Buysse [sbuysse@buypin.com]
Portions created by Sébastien Buysse are Copyright (C) 2001 Sébastien Buysse.
All Rights Reserved.

Contributor(s): Michael Beck [mbeck@bigfoot.com].

Last Modified: 2000-02-28

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}

{$I JVCL.INC}

unit JvStringListToHtml;

interface

uses
  SysUtils, Classes,
  JvComponent;

type
  TJvStringListToHtml = class(TJvComponent)
  published
    procedure ConvertToHtml(Value: TStringList; Path: string);
    function ConvertToHtmlStringList(Value: TStringList): TStringList;
  end;

implementation

resourcestring
  RC_Html1 = '<HTML>';
  RC_Html2 = '<TITLE>TStringList converted with JEDI-VCL Component</TITLE>';
  RC_Html3 = '<BODY>';
  RC_Html4 = '<BR>';
  RC_Html5 = '</BODY>';
  RC_Html6 = '</HTML>';

procedure TJvstringListToHtml.ConvertToHtml(Value: TStringList; Path: string);
var
  List: TStringList;
begin
  // (rom) classic memory leak fixed
  List := ConvertToHtmlStringList(Value);
  try
    List.SaveToFile(Path);
  finally
    List.Free;
  end;
end;

function TJvstringListToHtml.ConvertToHtmlStringList(Value: TStringList): TStringList;
var
  I: Integer;
begin
  Result := TStringList.Create;
  Result.Add(RC_Html1);
  Result.Add(RC_Html2);
  Result.Add(RC_Html3);
  for I := 0 to Value.Count - 1 do
    Result.Add(RC_Html4 + Value[I]);
  Result.Add(RC_Html5);
  Result.Add(RC_Html6);
end;

end.

