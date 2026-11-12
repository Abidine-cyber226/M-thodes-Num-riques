// TP1 MN2 -- application etudiante. Noms des trois membres : SORGHO Abidine 20240194-NIKIEMA Joris 20240175
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
    // TODO 1 : calcul des integrales approchees
ET(k) = trapezes(t, y);
ES(k) = simpson(t, y);

// TODO 2 : erreurs absolues par rapport a Iref
errT(k) = abs(ET(k) - Iref);
errS(k) = abs(ES(k) - Iref);
mprintf("n=%d T=%.9f S=%.9f ET=%.3e ES=%.3e\n", ..
    n, ET(k), ES(k), errT(k), errS(k));
end

for k = 1:length(ns)-1
   // TODO 3 : ordres observes entre n et 2n
pT = ordre_observe(errT(k), errT(k+1));
pS = ordre_observe(errS(k), errS(k+1));
mprintf("n=%d -> %d : pT=%.3f pS=%.3f\n", ..
            ns(k), ns(k+1), pT, pS);
end

// Cas discret : releves de puissance d'une pompe, temps en minutes.
tmin = [0 10 20 30 40];
Pkw = [2.0 2.6 3.0 2.5 1.9];
th = zeros(1, length(tmin));
for i = 1:length(tmin)
    // TODO 4 : convertir les minutes en heures.
for i = 1:length(tmin)
    th(i) = tmin(i) / 60;
end
// TODO 5 : energie par les deux quadratures (en kWh).
// Energie estimee par les deux methodes
Etrap = trapezes(th, P);
Esimp = simpson(th, P);

// Ecart entre les estimations et borne d'incertitude
ecart = abs(Etrap - Esimp);
incertitude = 0.1 * 40 / 60;

mprintf("Energie par les trapezes : %.6f kWh\n", Etrap);
mprintf("Energie par Simpson      : %.6f kWh\n", Esimp);
mprintf("Ecart entre estimations  : %.6f kWh\n", ecart);
mprintf("Borne d'incertitude      : %.6f kWh\n", incertitude);

