with Spi_Types;
with System.Storage_Elements; use System.Storage_Elements;

generic
   type Device_T is limited private;
   with procedure Driver_Init     (Dev : in out Device_T;
                                   Cfg : Spi_Types.Spi_Config);
   with procedure Driver_Enable   (Dev : in out Device_T);
   with procedure Driver_Disable  (Dev : in out Device_T);
   with procedure Driver_Reset    (Dev : in out Device_T);
   with procedure Driver_Transfer (Dev : in out Device_T;
                                   TX  : Storage_Element;
                                   RX  : out Storage_Element);

package Spi_Interface is
   subtype Device is Device_T;

   procedure Open  (Dev : in out Device; 
                    Cfg : Spi_Types.Spi_Config);

   procedure Close (Dev : in out Device);

   procedure Reset (Dev : in out Device);

   procedure Write (Dev     : in out Device;
                    Buf     : Storage_Array);

   procedure Read  (Dev      : in out Device;
                    Buf      : out Storage_Array);

end Spi_Interface;
