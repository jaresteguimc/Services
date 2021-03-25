using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel.Web;
using System.ServiceModel;

namespace Contract.ServiceContract
{
    [ServiceContract]
    public interface IGes_OperativaService
    {
        [OperationContract()]
        [WebInvoke(Method = "POST", UriTemplate = "FW_Una_consulta_solicitud_clientes")]
        string FW_Una_consulta_solicitud_clientes(string __a);
        [OperationContract()]
        [WebInvoke(Method = "POST", UriTemplate = "FW_Una_Add_Clientes(")]
        string FW_Una_Add_Clientes(string __a);
        [OperationContract()]
        [WebInvoke(Method = "POST", UriTemplate = "FW_Una_Add_Bono(")]
        string FW_Una_Add_Bono(string __a);
        

    }
}
