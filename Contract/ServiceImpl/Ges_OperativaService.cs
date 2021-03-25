using Business.Common.Servicio;
using Contract.DataContract;
using Contract.ServiceContract;
using Lucky.CFG.JavaMovil;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contract.ServiceImpl
{
    public class Ges_OperativaService : IGes_OperativaService
    {
        private static readonly B_Ges_Operativa oBLGesOperativa = new B_Ges_Operativa();
        public string FW_Una_consulta_solicitud_clientes(string __a)
        {
            Request_Clientes oRq = HelperJson.Deserialize<Request_Clientes>(__a);

            Response_FW_Clientes oRp = new Response_FW_Clientes();
            try
            {
                oRp.Obj = oBLGesOperativa.B_FW_Clientes(oRq.pOpcion, oRq.pParametro);
                oRp.Estado = BaseResponse.EXITO;
            }
            catch (Exception ex)
            {
                oRp.Descripcion = ex.Message;
                oRp.Estado = BaseResponse.GENERAL_ERROR;
            }
            return HelperJson.Serialize<Response_FW_Clientes>(oRp);
        }
        public string FW_Una_Add_Clientes(string __a)
        {
            Request_Clientes oRq = HelperJson.Deserialize<Request_Clientes>(__a);

            Response_FW_add_solicitud oRp = new Response_FW_add_solicitud();
            try
            {
                oRp.obj = oBLGesOperativa.B_FW_Add_Clientes(oRq.pOpcion, oRq.pParametro);
                oRp.Estado = BaseResponse.EXITO;
            }
            catch (Exception ex)
            {

                oRp.Descripcion = ex.Message;
                oRp.Estado = BaseResponse.GENERAL_ERROR;
            }

            return HelperJson.Serialize<Response_FW_add_solicitud>(oRp);

        }
        public string FW_Una_Add_Bono(string __a)
        {
            Request_Clientes oRq = HelperJson.Deserialize<Request_Clientes>(__a);

            Response_FW_add_solicitud oRp = new Response_FW_add_solicitud();
            try
            {
                oRp.obj = oBLGesOperativa.B_FW_Add_Bono(oRq.pOpcion, oRq.pParametro);
                oRp.Estado = BaseResponse.EXITO;
            }
            catch (Exception ex)
            {

                oRp.Descripcion = ex.Message;
                oRp.Estado = BaseResponse.GENERAL_ERROR;
            }

            return HelperJson.Serialize<Response_FW_add_solicitud>(oRp);


        }
    }
}
