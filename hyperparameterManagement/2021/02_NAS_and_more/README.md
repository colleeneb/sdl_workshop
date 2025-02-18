# From Neural Architecture Search to Automated Deep Ensemble with Uncertainty Quantification

In this tutorial we will present how to run neural architecture search, joint hyperparameter and neural architecture search, and deep ensemble with DeepHyper on the **ThetaGPU** system. The machine learning task is about learning and understanding the uncertainties from synthetic data.

To execute this tutorial it is possible to run an interactive Jupyter notebook locally or in an interactive session on ThetaGPU.

## Local execution

Install DeepHyper with the `analytics` option then launch Jupyter:

```console
jupyter notebook
```

## ThetaGPU execution

1. From a `thetalogin` node: `ssh thetagpusn1` to login to a ThetaGPU service node.
2. From `thetagpusn1`, start an interactive job (**note** which `thetagpuXX` node you get placed onto will vary):

```bash
(thetagpusn1) $ qsub -I -A SDL_Workshop -n 1 -q training-gpu -t 60
Job routed to queue "full-node".
Wait for job 10003623 to start...
Opening interactive session to thetagpu21
```

3. From the ThetaGPU compute node (`thetagpuXX`), execute the `launch-jupyter-notebook-thetagpu.sh` script:

```bash
(thetagpu21) $ ./launch-jupyter-notebook-thetagpu.sh
```

Take note of the output URL and output ssh command of the form:

```bash
# URL
http://localhost:8888/?token=df11ba29aac664173832b98d1d4b3b96ee0f050992ae6591
# SSH Command
ssh -tt -L 8888:localhost:8888 -L 8265:localhost:8265 regele@theta.alcf.anl.gov "ssh -L 8888:localhost:8888 -L 8265:localhost:8265 thetagpu05"
```

4. Leave the interactive session running and open a new terminal window on your local machine.
5. In the new terminal window, execute the SSH command to link the local port to the ThetaGPU compute node.
6. Open the Jupyter URL (`http:localhost:8888/?token=....`) in a local browser.

## ThetaKNL execution

1. From a `thetalogin` start an interactive job:

```bash
(thetalogin4) $ qsub -I -A SDL_Workshop -n 1 -t 60 -q training-knl --attrs enable_ssh=1
Job routed to queue "training-knl".
Wait for job 10003623 to start...
Opening interactive session to thetamom3
```

3. From the ThetaKNL Mom node (`thetamomX`), ssh to a compute node:

```bash
ssh $(printf "nid%05d" $COBALT_PARTNAME)
```

4. From the ThetaKNL compute node (`nidXXXXX`), execute the `launch-jupyter-notebook-thetaknl.sh` script:

```bash
(nidXXXXX) $ ./launch-jupyter-notebook-thetaknl.sh
```

Take note of the output URL and output ssh command of the form:

```bash
# URL
http://localhost:8888/?token=df11ba29aac664173832b98d1d4b3b96ee0f050992ae6591
# SSH Command
ssh -tt -L 8888:localhost:8888 -L 8265:localhost:8265 regele@theta.alcf.anl.gov "ssh -L 8888:localhost:8888 -L 8265:localhost:8265 -J thetamom3 nid03835"
```

4. Leave the interactive session running and open a new terminal window on your local machine.
5. In the new terminal window, execute the SSH command to link the local port to the ThetaKNL compute node.
6. Open the Jupyter URL (`http:localhost:8888/?token=....`) in a local browser.
