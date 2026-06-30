with System.Storage_Elements; use System.Storage_Elements;

generic
   with procedure Driver_Transfer (TX  : Storage_Element;
                                   RX  : out Storage_Element);
package Spi_Data is

   procedure Write (Buf : Storage_Array);
   procedure Read (Buf : out Storage_Array);

end Spi_Data;
