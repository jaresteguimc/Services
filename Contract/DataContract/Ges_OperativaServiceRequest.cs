using Entity.Common.Servicio;
using Lucky.CFG.JavaMovil;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;


namespace Contract.DataContract
{
    public class Request_Clientes
    {
       
        [JsonProperty("_a")]
        public int pOpcion { get; set; }
        [JsonProperty("_b")]
        public string pParametro { get; set; }


    }
    public class Response_FW_Clientes : BaseResponse
    {
    
        [JsonProperty("_a")]
        public List<E_Clientes> Obj { get; set; }
    }
    public class Response_FW_add_solicitud : BaseResponse
    {
        [JsonProperty("_a")]
        public string obj { get; set; }
    }
}
