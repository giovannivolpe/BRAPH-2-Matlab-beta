# Group of Subjects with Connectivity Data

[![Tutorial Group of Subjects with Connectivity Data](https://img.shields.io/badge/PDF-Download-red?style=flat-square&logo=adobe-acrobat-reader)](tut_gr_con.pdf)

For *connectivity data*, a connectivity matrix per subject is already available and can be directly imported into the relative analysis pipeline. For example, the connectivity matrix could correspond to white matter tracts obtained from dMRI or pre-calculated coactivations maps obtained from fMRI data.
This Tutorial explains how to prepare and work with this kind of data.

> ![GUI for a group of subjects with connectivity data](fig01.png)
> 
> **Figure 1. GUI for a group of subjects with connectivity data.**
> Full graphical user interface to upload a group of subjects with connectivity data in BRAPH 2.0.

## Open the GUI

In most analyses, the group GUI is the second step after you have selected a brain atlas. You can open it by typing `braph2` in the MatLab's terminal, which allows you to select a pipeline containing the steps required to perform your analysis and upload a brain atlas. After these steps have been completed you can upload your group's data, as shown in Figure 1.

> ![Upload the data of a group of subjects](fig02.png)
> 
> **Figure 2. Upload the data of a group of subjects.**
> Steps to upload a group of subjects with connectivity data using the GUI and an example dataset:
> **a** Open the group GUI.
> **b** Import a folder containing the connectivity matrices in XLS or TXT format (see below for details on their format).
> To upload the test connectivity data:
> **c-f** navigate to the BRAPH 2.0 folder `pipelines`, **d** `connectivity`, **e** `Example data CON XLS`, and **f** select the folder containing the connectivity matrices of one group `CON_Group_1_XLS`.

To open the GUI and upload the brain connectivity data, you can also do it from the command line (i.e., without opening an analysis pipeline) by typing the commands referenced below.

```matlab
gr = Group('SUB_CLASS', 'SubjectCON');  % creates a new object Group with subjects with connectivity data, i.e., SubjectCON.

gui = GUIElement('PE', gr);  % creates a GUI to upload the group data.
gui.get('DRAW');  % draws the GUI.
gui.get('SHOW');  % shows the GUI.
```

## Visualize the Group Data

After completing the steps described in the Figure 2, you can see the data as shown in Figure 3a, and change the Group ID, name, and notes as in Figure 3b.

> ![Edit the group metadata](fig03.png)
> 
> **Figure 3. Edit the group metadata.** 
> **a** The GUI of the group's connectivity data.
> **b** The information you see on this GUI that can be changed. In this example, we have edited the ID, name, and notes of the group but can also change the subject's specific information.

## Visualize Each Subject's Data

Finally, you can open each subject's connectivity matrix by selecting the subject, right-click, and select "Open selection" as shown in **Figure 4a**, which displays the matrix values in **Figure 4b**. Here, you can also change the subject's metadata (ID, label, notes), its variables of interest, and the values of its connectivity matrix.

> ![Edit the individual subject data](fig04.png)
> 
> **Figure 4. Edit the individual subject data.** 
> **a** Each subject's connectivity matrix can be opened by selecting the subject, right-click, and select "Open selection".
> **b** In this subject GUI, it is possible to view and edit the metadata of the subject (ID, label, notes), its variables of interest (in this case, age and sex), and the values of the connectivity matrix.

