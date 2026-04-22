with System.Storage_Elements; use System.Storage_Elements;

generic
   type Device is limited private;
   with procedure Driver_Transfer (Dev : in out Device;
                                   TX  : Storage_Element;
                                   RX  : out Storage_Element);
package Spi_Data is

   procedure Write (Dev : in out Device; Buf : Storage_Array);
   procedure Read (Dev : in out Device; Buf : out Storage_Array);

end Spi_Data;
