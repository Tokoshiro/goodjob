package com.example.goodjob.fragments;


import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.example.goodjob.R;
import com.example.goodjob.classes.Empresa;

public class SolicitudEmpresaDetalleFragment extends Fragment {

    private Empresa empresa;
    /* TODO 1.1 aqui declaras los views del layout.
        Ejemplo: private TextView fechaRegistro;
    * */

    public SolicitudEmpresaDetalleFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.fragment_solicitud_empresa_detalle, container, false);

        Bundle bundle = this.getArguments();
        if (bundle != null)
            empresa = bundle.getParcelable("empresa");
        mapearViews(v);
        mostrarDatos(empresa);
        return v;
    }

    private void mapearViews(View v) {
        /* TODO 1.2 aqui haces los findViewById();
            Ejemplo: fechaRegistro = v.findViewById(R.id.tvFechaRegistro);
        * */
    }

    private void mostrarDatos(Empresa e) {
        /* TODO 1.3 y aca haces los setText para mostrar la info en el layout.
            Ejemplo: fechaRegistro.setText(e.getFechaRegistro());
        * */
    }

    /* TODO 1.4 este solo es un recordatorio para que borres todos los TODO(1.0 - 1.4)
        una vez termines.
     * */

}
