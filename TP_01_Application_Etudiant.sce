// TP1 MN2 -- application etudiante. Noms des trois membres : ...
// Placer ce fichier et TP_01_Outils_Quadrature.sce dans le meme dossier.
clear;
exec("TP_01_Outils_Quadrature.sce", -1);

// Cas continu : modele normalise d'une puissance variable.
function y = modele(x)
    y = exp(x);
endfunction
Iref = %e-1; // Integrale exacte sur [0,1].
ns = [4 8 16 32];
ET = zeros(1, length(ns)); ES = ET;
errT = ET; errS = ET;
for k = 1:length(ns)
    n = ns(k);
    [t, y] = echantillonner(modele, 0, 1, n);
    // TODO 1 : utiliser les deux quadratures du CM1.
    ET(k) = %nan;
    ES(k) = %nan;
    // TODO 2 : erreurs absolues par rapport a Iref.
    errT(k) = %nan;
    errS(k) = %nan;
    mprintf("n=%d T=%.9f S=%.9f ET=%.3e ES=%.3e\n", ..
            n, ET(k), ES(k), errT(k), errS(k));
end
for k = 1:length(ns)-1
    // TODO 3 : mesurer les ordres entre n et 2n.
    pT = %nan;
    pS = %nan;
    mprintf("n=%d -> %d : pT=%.3f pS=%.3f\n", ..
            ns(k), ns(k+1), pT, pS);
end

// Cas discret : releves de puissance d'une pompe, temps en minutes.
tmin = [0 10 20 30 40];
Pkw = [2.0 2.6 3.0 2.5 1.9];
th = zeros(1, length(tmin));
for i = 1:length(tmin)
    // TODO 4 : convertir les minutes en heures.
    th(i) = %nan;
end
// TODO 5 : energie par les deux quadratures (en kWh).
Etrap = %nan;
Esimp = %nan;
mprintf("Pompe : trapezes=%.6f kWh ; Simpson=%.6f kWh\n", ..
        Etrap, Esimp);
mprintf("Ecart=%.6f kWh ; borne des lectures=%.6f kWh\n", ..
        abs(Etrap-Esimp), 0.1*40/60);

// Dans le rapport : dire ce que les calculs permettent de conclure.
// Ne pas deduire un ordre de convergence des cinq mesures de la pompe.
